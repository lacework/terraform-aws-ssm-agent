provider "aws" {
  region = "us-east-1"
}

provider "lacework" {}

resource "lacework_agent_access_token" "ssm_deployment" {
  name        = "ssm-deployment"
  description = "Used to deploy agents using AWS System Manager"
}

module "lacework_aws_ssm_agents_install" {
  source = "../../"

  lacework_agent_tags = {
    env = "dev"
  }

  aws_resources_tags = {
    billing = "testing"
    owner   = "myself"
  }

  lacework_access_token = lacework_agent_access_token.ssm_deployment.token
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

  compliance_severity = "HIGH"
}
