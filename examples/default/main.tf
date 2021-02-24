provider "aws" {
  region  = "us-east-1"
  profile = "dev_ops"
}

module "lacework_aws_ssm_agents_install" {
  source = "../../"

  lacework_access_token = "your-token-here"

  lacework_agent_tags = {
    env = "dev"
  }

  aws_resources_tags = {
    billing = "testing"
    owner   = "myself"
  }
}
