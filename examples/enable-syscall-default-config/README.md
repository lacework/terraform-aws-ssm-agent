# AWS SSM Command with Syscall Default Config Enabled

This example shows how to enable the syscall default config in
the agent.

```hcl
provider "aws" {
  region = "us-west-2"
}

module "lacework_aws_ssm_agents_install_enable_syscall_default_config" {
  source  = "lacework/ssm-agent/aws"
  version = "~> 0.4"

  lacework_enable_default_syscall_config = true
}
```
