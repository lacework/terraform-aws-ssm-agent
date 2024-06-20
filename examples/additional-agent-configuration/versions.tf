terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = "~> 4.0"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.18"
    }
  }
}
