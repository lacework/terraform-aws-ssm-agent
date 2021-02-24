variable "lacework_access_token" {
  type        = string
  description = "The access token for the Lacework agent"
}

variable "lacework_agent_tags" {
  type        = map(string)
  description = "A map/dictionary of Tags to be assigned to the Lacework datacollector"
  default     = {}
}

variable "aws_resources_prefix" {
  type        = string
  description = "Prefix to use for created AWS resources"
  default     = ""
}

variable "aws_resources_tags" {
  type        = map(string)
  description = "A map/dictionary of Tags to be assigned to created AWS resources"
  default     = {}
}
