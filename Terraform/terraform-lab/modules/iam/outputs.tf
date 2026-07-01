output "instance_profile_name" {
  value = aws_iam_instance_profile.main.name
}

output "ec2_role_arn" {
  value = aws_iam_role.main.arn
}