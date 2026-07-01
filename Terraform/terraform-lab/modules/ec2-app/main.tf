data "aws_ami" "instance" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = [ "al2023-ami-2023.*-x86_64" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
}

resource "aws_instance" "app" {
  for_each = toset(var.private_subnet_ids)
  iam_instance_profile = var.instance_profile_name
  ami = data.aws_ami.instance.id
  instance_type = "t3.micro"
  subnet_id = each.value
  vpc_security_group_ids = [var.app_sg_id]
  user_data = local.user_data
}

resource "aws_lb_target_group_attachment" "app" {
  for_each = aws_instance.app
  target_group_arn = var.target_group_arn
  target_id = each.value.id
  port = var.app_port
}