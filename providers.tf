terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-cicd-with-github-actions"
    region         = "us-east-1"
    key            = "dev/terraform.tfstate"
    dynamodb_table = "terraform-cicd-with-github-actions"
  }
}

provider "aws" {
  region = "us-east-1"
}

