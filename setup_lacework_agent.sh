#!/usr/bin/env bash

set -e

LACEWORK_INSTALL_PATH="{{ LaceworkInstallPath }}"

# TODO: Fetch the token from AWS SSM Parameter Store instead of taking it in as a Command parameter (avoid leaks in the AWS Console)
TOKEN='{{ Token }}'
TAGS='{{ Tags }}'
BUILD_HASH='{{ Hash }}'

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

get_curl() {
  if command_exists curl; then
    curl='curl -sSL'
  elif command_exists wget; then
    curl='wget -qO-'
  elif command_exists busybox && busybox --list-modules | grep -q wget; then
    curl='busybox wget -qO-'
  fi
}

notify_use_docker() {
  echo "This host appears to be a Kubernetes node, please use the Kubernetes deployment method (https://support.lacework.com/hc/en-us/articles/360005263034-Deploy-on-Kubernetes)."
  exit 0
}

curl=''
get_curl

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

# Check if Lacework is pre-installed. If not installed, install.
if [ ! -f "$LACEWORK_INSTALL_PATH/datacollector" ]; then
  echo "Lacework agent not installed, installing..."

  _install_sh="https://packages.lacework.net/install.sh"
  if [ "$BUILD_HASH" != "" ]; then
    _install_sh="https://s3-us-west-2.amazonaws.com/www.lacework.net/download/${BUILD_HASH}/install.sh"
  fi

  # TODO: Verify the signature of the install.sh script
  $curl "$_install_sh" >/tmp/install.sh

  chmod +x /tmp/install.sh

  sudo /tmp/install.sh "$TOKEN"

  rm /tmp/install.sh
fi

# TODO: Add the support for other Lacework configuration options
echo "Updating the Lacework agent config.json file..."
cat >"$LACEWORK_INSTALL_PATH/config/config.json" <<EOF
{
  "tokens": {
    "AccessToken": "$TOKEN"
  },
  "tags": $TAGS
}
EOF

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

echo "Lacework configured successfully!"
