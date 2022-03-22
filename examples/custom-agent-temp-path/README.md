# AWS SSM Command using a Custom Temporary Path

This example shows how to customize the Lacework Agent installation to use a
explcitly defined temporary path for downloading the installation script - rather than `/tmp`.

```hcl
provider "aws" {
  region = "us-west-2"
}

module "lacework_ssm_agents_install_custom_agent_build_hash" {
  source  = "lacework/ssm-agent/aws"
  version = "~> 0.4"

  lacework_agent_temp_path = "/new/temp/path"
}
```
