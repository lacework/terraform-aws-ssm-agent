# AWS SSM Command using a Custom Server URL

This example shows how to customize the Agent Server URL for
EU deployments.

```hcl
provider "aws" {
  region = "us-west-2"
}

module "lacework_ssm_agents_install_custom_server_url" {
  source  = "lacework/ssm-agent/aws"
  version = "~> 0.4"

  lacework_server_url   = "https://agent.lacework.net"
}
```
