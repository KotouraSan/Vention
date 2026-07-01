variable "project_name" {
  type    = string
  default = "terraform-lab"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "app_port" {
  type    = number
  default = 8080
}

variable "db_port" {
  type    = number
  default = 5432
}

variable "vpc_id" {
  type = string
}