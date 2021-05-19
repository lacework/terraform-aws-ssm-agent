# AWS SSM Command using a Custom Agent Build Hash

This example shows how to customize the version of the Lacework Agent
that will be installed on the Linux EC2 intances.

To get the Agent Build Hash (`lacework_agent_build_hash`) contact support@lacework.net.

```hcl
provider "aws" {
  region = "us-west-2"
}

module "lacework_ssm_agents_install_custom_agent_build_hash" {
  source  = "lacework/ssm-agent/aws"
  version = "~> 0.4"

  lacework_agent_build_hash = "3.7.2_2021-03-26_branch_123HASH"
}
```
