vpc_cidr = "10.1.0.0/16"

public_subnet_cidrs   = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs  = ["10.1.10.0/24", "10.1.11.0/24"]
database_subnet_cidrs = ["10.1.20.0/24", "10.1.21.0/24"]

project_name = "terraform-lab"
environment  = "prod"
aws_region   = "eu-north-1"