resource "aws_iam_role" "main" {
  name = "${var.project_name}-${var.environment}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },

    ]
  })
  tags = {
    Name        = "${var.project_name}-${var.environment}-iam-role"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_iam_instance_profile" "main" {
  name = "${var.project_name}-${var.environment}-ec2-profile"
  role = aws_iam_role.main.name
}