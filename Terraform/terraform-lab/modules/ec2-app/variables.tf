variable "project_name" {
  type    = string
  default = "terraform-lab"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "app_sg_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "app_port" {
  type    = number
  default = 8080
}

variable "instance_profile_name" {
  type = string
}