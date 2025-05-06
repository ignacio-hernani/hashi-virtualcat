terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.96.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "hcp" {
}
