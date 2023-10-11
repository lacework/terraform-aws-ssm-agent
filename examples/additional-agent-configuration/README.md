# Default AWS SSM command deployment

This example shows how to set additional agent configuration.
See https://docs.lacework.net/onboarding/restricted/configure-agent-behavior-in-configjson-file for more details.

```hcl
provider "aws" {
  region = "us-east-1"
}

module "lacework_aws_ssm_agents_install" {
  source  = "lacework/ssm-agent/aws"
  version = "~> 0.4"

  lacework_agent_tags = {
    env = "dev"
  }

  lacework_enable_default_syscall_config = "true"

  aws_resources_tags = {
    billing = "testing"
    owner   = "myself"
  }

  lacework_agent_configuration = {
    "codeaware":{"enable":"all"}
  }
}

resource "aws_resourcegroups_group" "testing" {
  name = "Testing"

  resource_query {
    query = jsonencode({
      ResourceTypeFilters = [
        "AWS::EC2::Instance"
      ]

      TagFilters = [
        {
          Key = "environment"
          Values = [
            "Testing"
          ]
        }
      ]
    })
  }

  tags = {
    billing = "testing"
    owner   = "myself"
  }
}

resource "aws_ssm_association" "lacework_aws_ssm_agents_install_testing" {
  association_name = "install-lacework-agents-testing-group"

  name = module.lacework_aws_ssm_agents_install.ssm_document_name

  targets {
    key = "resource-groups:Name"
    values = [
      aws_resourcegroups_group.testing.name,
    ]
  }

  parameters = {
    Token = "my-lacework-token"
  }

  compliance_severity = "HIGH"
}
```
