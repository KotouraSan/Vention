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

variable "db_name" {
  type    = string
  default = "lab9"
}

variable "db_username" {
  type    = string
  default = "dbadmin"
}

variable "app_port" {
  type    = number
  default = 8080
}

variable "bucket_name" {
  type    = string
  default = "vention-lab9-terraform-vention"
}

variable "manual_bucket_name" {
  type    = string
  default = "terraform-lab-ksan-manual-import"
}