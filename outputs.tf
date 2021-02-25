output "ssm_document_name" {
  description = "Name of the AWS SSM Document that setups the Lacework agent"
  value       = aws_ssm_document.setup_lacework_agent.name
}
