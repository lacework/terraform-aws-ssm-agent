#!/usr/bin/env bash

set -e

# Variables coming from the SSM Document
LACEWORK_INSTALL_PATH='{{ LaceworkInstallPath }}'
LACEWORK_TEMP_PATH='{{ LaceworkTempPath }}'
TAGS='{{ Tags }}'
BUILD_HASH='{{ Hash }}'
SERVER_URL='{{ Serverurl }}'
# TODO: Fetch the token from AWS SSM Parameter Store instead of
#       taking it in as a Command parameter (avoid leaks in the AWS Console)
TOKEN='{{ Token }}'

# Global variables
_curl=''

main() {
  get_curl
  verify_valid_token
  verify_valid_host
  install_lacework_agent
  render_agent_config
  verify_agent_running
  echo "Lacework configured successfully!"
}

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

get_curl() {
  if command_exists curl; then
    _curl='curl -sSL'
  elif command_exists wget; then
    _curl='wget -qO-'
  elif command_exists busybox && busybox --list-modules | grep -q wget; then
    _curl='busybox wget -qO-'
  fi
}

notify_use_docker() {
  echo "This host appears to be a Kubernetes node, please use the Kubernetes deployment method (https://support.lacework.com/hc/en-us/articles/360005263034-Deploy-on-Kubernetes)."
  exit 0
}

render_agent_config() {
  local _config_json
  local _token_json
  local _server_url_json
  local _tags_json

  # Token
  _token_json='"tokens": { "AccessToken": "'$TOKEN'" },'

  # Server URL
  if [ "$SERVER_URL" != "" ]; then
    _server_url_json='"serverurl": "'$SERVER_URL'",'
  fi

  # Tags
  _tags_json='"tags": '${TAGS:-"{}"}

  # Render config.json
  #
  # NOTE: We must leave the $_tags_json as the last element of the config.json
  #       file since it doesn't have a ',' at the end that that will generate
  #       a valid JSON
  _config_json="""{
  ${_token_json}
  ${_server_url_json}
  ${_tags_json}
}"""

  echo "Updating the Lacework agent config.json file..."
  if [ ! -d "$LACEWORK_INSTALL_PATH/config" ]; then
    mkdir "$LACEWORK_INSTALL_PATH/config"
  fi
  echo "$_config_json" > "$LACEWORK_INSTALL_PATH/config/config.json"
}

install_lacework_agent() {
  # Check if Lacework is pre-installed. If not installed, install.
  if [ ! -f "$LACEWORK_INSTALL_PATH/datacollector" ]; then
    echo "Lacework agent not installed, installing..."

    _install_sh="https://packages.lacework.net/install.sh"
    if [ "$BUILD_HASH" != "" ]; then
      _install_sh="https://updates.lacework.net/${BUILD_HASH}/install.sh"
    fi

    # TODO: Verify the signature of the install.sh script
    $_curl "$_install_sh" >"$LACEWORK_TEMP_PATH/install.sh"

    chmod +x "$LACEWORK_TEMP_PATH/install.sh"

    sudo "$LACEWORK_TEMP_PATH/install.sh" "$TOKEN"

    rm "$LACEWORK_TEMP_PATH/install.sh"
  fi
}

verify_agent_running() {
  # Make sure the Lacework datacollector service is enabled and running
  if command_exists systemctl; then
    if ! systemctl is-active --quiet datacollector; then
      echo "Enabling the Lacework datacollector service"
      systemctl enable datacollector

      echo "Starting the Lacework datacollector service"
      systemctl start datacollector
    fi
  elif command_exists service; then
    if ! service datacollector status; then
      echo "Starting the Lacework datacollector service"
      service datacollector start
    fi
  fi
}

verify_valid_host() {
  # Check if the host is a Kubernetes node. If so, don't install, notify to use Docker instead
  if command_exists systemctl; then
    if systemctl list-unit-files | grep kubelet; then
      notify_use_docker
    fi
  elif command_exists service; then
    if service --status-all | grep -Fq 'kubelet'; then
      notify_use_docker
    fi
  else
    echo "Cannot check if this host is a Kubernetes node, aborting!"
    exit 1
  fi
}

verify_valid_token() {
  # Check to make sure that a Lacework agent access token was provided. If not, exit
  if [ -z "$TOKEN" ]; then
    echo "Lacework agent access token was empty, aborting!"
    exit 1
  fi
}

main
