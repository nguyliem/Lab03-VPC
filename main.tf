terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "liempart3" {
  cidr_block           = "10.0.0.0/16"
  tags                 = merge(var.project_tags)
}
