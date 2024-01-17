variable "lacework_agent_build_hash" {
  type        = string
  description = "An Agent build hash provided by Lacework"
  default     = ""
}

variable "lacework_access_token" {
  type        = string
  description = "The access token for the Lacework agent"
  default     = ""
}

variable "lacework_agent_tags" {
  type        = map(string)
  description = "A map/dictionary of Tags to be assigned to the Lacework datacollector"
  default     = {}
}

variable "lacework_agent_configuration" {
  type        = any
  description = "A map/dictionary of configuration parameters for the Lacework agent"
  default     = {}
}

variable "lacework_agent_temp_path" {
  type        = string
  description = "The temporary path for the Lacework installation script"
  default     = "/tmp"
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

variable "lacework_server_url" {
  type        = string
  default     = ""
  description = "The server URL for the Lacework agent"
}

variable "lacework_enable_default_syscall_config" {
  type        = string
  default     = "false"
  description = "A flag to enable the default syscall config"
}

variable "lacework_telemetry_disabled" {
  type        = bool
  default     = false
  description = "Disable Lacework telemetry"
}
