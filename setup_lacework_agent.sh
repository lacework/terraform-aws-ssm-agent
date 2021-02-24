#!/usr/bin/env bash

set -e

LACEWORK_INSTALL_PATH="{{ LaceworkInstallPath }}"

# TODO: Fetch the token from AWS SSM Parameter Store instead of taking it in as a Command parameter (avoid leaks in the AWS Console)
TOKEN='{{ Token }}'
TAGS='{{ Tags }}'

# TODO: Handle systems that don't have systemctl
if systemctl is-active --quiet kubelet; then
  echo "This host appears to be a Kubernetes node, please use the Kubernetes deployment method (https://support.lacework.com/hc/en-us/articles/360005263034-Deploy-on-Kubernetes)."
  exit 0
fi

if [ ! -d "$LACEWORK_INSTALL_PATH" ]; then
  echo "Lacework agent not installed, installing..."

  # TODO: Add the support for hosts that don't have curl installed
  curl https://packages.lacework.net/install.sh >/tmp/install.sh

  chmod +x /tmp/install.sh

  # TODO: Pass tags to the installation script
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

echo "Lacework configured successfully!"
