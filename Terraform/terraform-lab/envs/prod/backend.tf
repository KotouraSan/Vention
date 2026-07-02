terraform {
  backend "s3" {
    bucket         = "vention-lock-state-s3-bucket-ksan"
    key            = "prod/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-lab-tf-locks"
    encrypt        = true
  }
}