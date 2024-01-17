locals {
  version_file   = "${abspath(path.module)}/VERSION"
  module_name    = basename(abspath(path.module))
  module_version = fileexists(local.version_file) ? file(local.version_file) : ""
}

resource "aws_ssm_document" "setup_lacework_agent" {
  name          = "${var.aws_resources_prefix}setup-lacework-agent"
  document_type = "Command"

  target_type = "/AWS::EC2::Instance"

  content = jsonencode({
    schemaVersion = "2.2"
    description   = "Setup the Lacework agent on a Linux instance"

    parameters = {
      LaceworkInstallPath = {
        type        = "String"
        description = "The expected Lacework installation path"
        default     = "/var/lib/lacework"
      }

      LaceworkTempPath = {
        type        = "String"
        description = "The temporary path for the Lacework installation script"
        default     = var.lacework_agent_temp_path
      }

      Token = {
        type        = "String"
        description = "The access token for the Lacework agent"
        default     = var.lacework_access_token
      }

      Tags = {
        type        = "String"
        description = "The Lacework agent tags"
        default     = jsonencode(var.lacework_agent_tags)
      }

      Serverurl = {
        type        = "String"
        description = "The server URL for the Lacework agent"
        default     = var.lacework_server_url
      }

      Hash = {
        type        = "String"
        description = "An Agent build hash provided by Lacework"
        default     = var.lacework_agent_build_hash
      }

      EnableDefaultSyscallConfig = {
        type        = "String"
        description = "A flag to enable the default syscall config"
        default     = var.lacework_enable_default_syscall_config
      }

      AdditionalConfig = {
        type        = "String"
        description = "Additional configuration parameters for the Lacework agent"
        default     = length(var.lacework_agent_configuration) == 0 ? "" : jsonencode(var.lacework_agent_configuration)
      }
    }

    mainSteps = [
      {
        action = "aws:runShellScript"
        name   = "SetupLaceworkAgent"

        precondition = {
          StringEquals = [
            "platformType",
            "Linux",
          ]
        }

        inputs = {
          runCommand = [
            file("${path.module}/setup_lacework_agent.sh"),
          ]
        }
      }
    ]
  })

  tags = var.aws_resources_tags
}

data "lacework_metrics" "lwmetrics" {
  name    = local.module_name
  version = local.module_version
}
