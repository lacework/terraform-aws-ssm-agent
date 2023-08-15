<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-aws-ssm-agent

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-aws-ssm-agent.svg)](https://github.com/lacework/terraform-aws-ssm-agent/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to create an AWS Systems Manager document for installing the Lacework Datacollector Agent on to AWS EC2 instances.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0, < 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0, < 5.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ssm_document.setup_lacework_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_document) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_resources_prefix | Prefix to use for created AWS resources | `string` | `""` | no |
| aws_resources_tags | A map/dictionary of Tags to be assigned to created AWS resources | `map(string)` | `{}` | no |
| lacework_access_token | The access token for the Lacework agent | `string` | `""` | no |
| lacework_agent_build_hash | An Agent build hash provided by Lacework | `string` | `""` | no |
| lacework_agent_tags | A map/dictionary of Tags to be assigned to the Lacework datacollector | `map(string)` | `{}` | no |
| lacework_agent_temp_path | The temporary path for the Lacework installation script | `string` | `"/tmp"` | no |
| lacework_server_url | The server URL for the Lacework agent | `string` | `""` | no |
| lacework_enable_default_syscall_config | A flag to enable the default syscall config | `string` | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| ssm_document_name | Name of the AWS SSM Document that setups the Lacework agent |
