variable "project_name" {
  type    = string
  default = "terraform-lab"
}

variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "database_subnet_cidrs" {
  type = list(string)
}
