variable "project_name" {
  type    = string
  default = "terraform-lab"
}

variable "environment" {
  type    = string
  default = "dev"
}
variable "database_subnet_ids" {
  type = list(string)
}

variable "db_sg_id" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}