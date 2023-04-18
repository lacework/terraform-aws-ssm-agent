provider "aws" {
  region = "us-west-2"
}

provider "lacework" {}

resource "lacework_agent_access_token" "ssm_deployment" {
  name        = "ssm-deployment"
  description = "Used to deploy agents using AWS System Manager"
}

module "lacework_ssm_agents_install_custom_server_url" {
  source = "../../"

  lacework_access_token = lacework_agent_access_token.ssm_deployment.token
  lacework_server_url   = "https://api.lacework.net"
}

resource "aws_resourcegroups_group" "testing" {
  name = "Testing"

  resource_query {
    query = jsonencode({
      ResourceTypeFilters = [
        "AWS::EC2::Instance"
      ]
    })
  }
}

resource "aws_ssm_association" "lacework_aws_ssm_agents_install_testing" {
  association_name = "install-lacework-agents-testing-group"

  name = module.lacework_ssm_agents_install_custom_server_url.ssm_document_name

  targets {
    key = "resource-groups:Name"
    values = [
      aws_resourcegroups_group.testing.name,
    ]
  }
}
