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

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = string
}