output "instance_ids" {
  value = [for instance in aws_instance.app : instance.id]
}

output "private_ips" {
  value = [for instance in aws_instance.app : instance.private_ip]
}