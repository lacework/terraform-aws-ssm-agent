terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = "~> 4.0"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.18"
    }
  }
}
