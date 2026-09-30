terraform {
  required_version = "~> 1.6.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.52.0, < 7.0.0"
    }
  }
}