terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region = us-east-1
}

resource "aws_vpc" "liempart3" {
  cidr_block           = "10.0.0.0/16"
  tags                 = "Terraform VPC for Part3"
}
