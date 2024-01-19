<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-aws-ssm-agent

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-aws-ssm-agent.svg)](https://github.com/lacework/terraform-aws-ssm-agent/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to create an AWS Systems Manager document for installing the Lacework Datacollector Agent on to AWS EC2 instances.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_lacework"></a> [lacework](#requirement\_lacework) | >= 1.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |
| <a name="provider_lacework"></a> [lacework](#provider\_lacework) | >= 1.18 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_document.setup_lacework_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_document) | resource |
| [lacework_metric_module.lwmetrics](https://registry.terraform.io/providers/lacework/lacework/latest/docs/data-sources/metric_module) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_resources_prefix"></a> [aws\_resources\_prefix](#input\_aws\_resources\_prefix) | Prefix to use for created AWS resources | `string` | `""` | no |
| <a name="input_aws_resources_tags"></a> [aws\_resources\_tags](#input\_aws\_resources\_tags) | A map/dictionary of Tags to be assigned to created AWS resources | `map(string)` | `{}` | no |
| <a name="input_lacework_access_token"></a> [lacework\_access\_token](#input\_lacework\_access\_token) | The access token for the Lacework agent | `string` | `""` | no |
| <a name="input_lacework_agent_build_hash"></a> [lacework\_agent\_build\_hash](#input\_lacework\_agent\_build\_hash) | An Agent build hash provided by Lacework | `string` | `""` | no |
| <a name="input_lacework_agent_configuration"></a> [lacework\_agent\_configuration](#input\_lacework\_agent\_configuration) | A map/dictionary of configuration parameters for the Lacework agent | `any` | `{}` | no |
| <a name="input_lacework_agent_tags"></a> [lacework\_agent\_tags](#input\_lacework\_agent\_tags) | A map/dictionary of Tags to be assigned to the Lacework datacollector | `map(string)` | `{}` | no |
| <a name="input_lacework_agent_temp_path"></a> [lacework\_agent\_temp\_path](#input\_lacework\_agent\_temp\_path) | The temporary path for the Lacework installation script | `string` | `"/tmp"` | no |
| <a name="input_lacework_enable_default_syscall_config"></a> [lacework\_enable\_default\_syscall\_config](#input\_lacework\_enable\_default\_syscall\_config) | A flag to enable the default syscall config | `string` | `"false"` | no |
| <a name="input_lacework_server_url"></a> [lacework\_server\_url](#input\_lacework\_server\_url) | The server URL for the Lacework agent | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssm_document_name"></a> [ssm\_document\_name](#output\_ssm\_document\_name) | Name of the AWS SSM Document that setups the Lacework agent |
<!-- END_TF_DOCS -->
