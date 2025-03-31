terraform {
  backend "s3" {
    bucket = "kushal2213"
    key = "test"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::600627357905:role/terraform"
  }
  region = "us-east-1"
}
