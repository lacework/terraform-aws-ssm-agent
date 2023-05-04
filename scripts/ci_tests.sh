#!/bin/bash
#
# Name::        ci_tests.sh
# Description:: Use this script to run ci tests of this repository
# Author::      Salim Afiune Maya (<afiune@lacework.net>)
#
set -eou pipefail

readonly project_name=terraform-aws-ssm-agent

TEST_CASES=(
  examples/default
  examples/access-lacework-token-via-provider
  examples/custom-agent-build-hash
  examples/custom-agent-temp-path
  examples/custom-server-url
)

log() {
  echo "--> ${project_name}: $1"
}

warn() {
  echo "xxx ${project_name}: $1" >&2
}

integration_tests() {
  for tcase in ${TEST_CASES[*]}; do
    log "Running tests at $tcase"
    ( cd $tcase || exit 1
      terraform init
      terraform validate
      terraform plan
    ) || exit 1
  done
}

lint_tests() {
  log "terraform fmt check"
  terraform fmt -check
}

sec_tests() {
  # TODO: replace with `lacework iac tf-scan tfsec -m MEDIUM`
  tfsec -m MEDIUM
}

main() {
  lint_tests
  integration_tests
  sec_tests
}

main || exit 99
