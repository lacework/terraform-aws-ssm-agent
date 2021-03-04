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
