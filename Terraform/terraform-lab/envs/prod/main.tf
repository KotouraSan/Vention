module "network" {
  source = "../../modules/network"

  project_name          = var.project_name
  environment           = var.environment
  aws_region            = var.aws_region
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs

  create_nat_gateway = true

}

module "security_group" {
  source = "../../modules/security-groups"

  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.network.vpc_id
}

module "application_load_balancer" {
  source = "../../modules/alb"

  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  alb_sg_id         = module.security_group.alb_sg_id
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment

}

module "ec2_app" {
  source = "../../modules/ec2-app"

  instance_profile_name = module.iam.instance_profile_name
  project_name          = var.project_name
  environment           = var.environment
  private_subnet_ids    = module.network.private_subnet_ids
  app_sg_id             = module.security_group.app_sg_id
  target_group_arn      = module.application_load_balancer.target_group_arn
  app_port              = var.app_port
}

module "rds" {
  source = "../../modules/rds"

  db_sg_id            = module.security_group.db_sg_id
  db_username         = var.db_username
  db_name             = var.db_name
  database_subnet_ids = module.network.database_subnet_ids
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

module "s3" {
  source = "../../modules/s3"

  bucket_name = "${var.project_name}-${var.environment}-vention-${random_id.bucket_suffix.hex}"
}
