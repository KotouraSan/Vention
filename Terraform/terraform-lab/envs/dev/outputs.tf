output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "database_subnet_ids" {
  value = module.network.database_subnet_ids
}

output "alb_sg_id" {
  value = module.security_group.alb_sg_id
}

output "app_sg_id" {
  value = module.security_group.app_sg_id
}

output "alb_dns_name" {
  value = module.application_load_balancer.alb_dns_name
}

output "target_group_arn" {
  value = module.application_load_balancer.target_group_arn
}

output "app_instance_ids" {
  value = module.ec2_app.instance_ids
}

output "app_private_ips" {
  value = module.ec2_app.private_ips
}

output "db_sg_id" {
  value = module.security_group.db_sg_id
}

output "db_name" {
  value = module.rds.db_name
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "aws_s3_bucket_name" {
  value = module.s3.bucket_name
}

output "aws_s3_bucket_arn" {
  value = module.s3.bucket_arn
}

output "aim_ec2_role_arn" {
  value = module.iam.ec2_role_arn
}

output "iam_instance_profile_name" {
  value = module.iam.instance_profile_name
}