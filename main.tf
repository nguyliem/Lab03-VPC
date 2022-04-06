resource "aws_vpc" "liempart3" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Liem Part3"
  }
}
