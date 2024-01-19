terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = ">= 3.0"
    lacework = {
      source  = "lacework/lacework"
      version = "~> 1.18"
    }
  }
}
