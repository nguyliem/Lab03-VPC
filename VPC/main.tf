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

resource "aws_security_group" "ssh" {
  name        = "public ssh"
  description = "Security Group Deployment"
  tags        = merge(var.project_tags)

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "liempart3" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags                 = merge(var.project_tags)
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags   = merge(var.project_tags)
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.default.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

# Create a subnet to launch our instances into
resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

