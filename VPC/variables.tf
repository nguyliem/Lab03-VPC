variable "region" {
  type = string
  default = "us-east-1"
}

variable "project_tags" {
  type = map(string)
  default = {
    Name       = "Liem Part3B"
    Owner      = "Liem Nguyen"
    Purpose    = "Testing"
    CostCenter = "0001"
  }
}
