#Configure the Terraform Cloud backend
terraform {
  cloud {
    organization = "ericliebl"
    workspaces {
      name = "resume"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

#Define the AWS provider
provider "aws" {
  region = var.region
}