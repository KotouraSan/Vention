resource "aws_iam_role" "main" {
  name = "vention-new"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid = ""
            Principal = {
                Service = "ec2.amazonaws.com"
            }
        },

    ]
  })
}

resource "aws_iam_instance_profile" "main" {
  name = "${var.project_name}-${var.environment}-ec2-profile"
  role = aws_iam_role.main.name
}