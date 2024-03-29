provider "aws" {
  region = "us-west-2"
}

module "lacework_ssm_agents_install_custom_agent_build_hash" {
  source = "../../"

  lacework_agent_temp_path = "/new/temp/path"
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

  name = module.lacework_ssm_agents_install_custom_agent_build_hash.ssm_document_name

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
