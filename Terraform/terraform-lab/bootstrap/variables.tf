variable "project_name" {
  type    = string
  default = "terraform-lab"
}

variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "state_bucket_name" {
  type    = string
  default = "vention-lock-state-s3-bucket-ksan"
}

variable "lock_table_name" {
  type    = string
  default = "terraform-lab-tf-locks"
}