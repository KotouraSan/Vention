locals {
  public_subnets = {
    public-a = {
      cidr = var.public_subnet_cidrs[0]
      az   = "${var.aws_region}a"
    }
    public-b = {
      cidr = var.public_subnet_cidrs[1]
      az   = "${var.aws_region}b"
    }
  }
  private_subnets = {
    private-a = {
      cidr = var.private_subnet_cidrs[0]
      az   = "${var.aws_region}a"
    }
    private-b = {
      cidr = var.private_subnet_cidrs[1]
      az   = "${var.aws_region}b"
    }
  }
  database_subnets = {
    database-a = {
      cidr = var.database_subnet_cidrs[0]
      az   = "${var.aws_region}a"
    }
    database-b = {
      cidr = var.database_subnet_cidrs[1]
      az   = "${var.aws_region}b"
    }
  }
}