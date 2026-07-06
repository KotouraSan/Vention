resource "aws_lb" "main" {
  name               = "${var.project_name}-${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.public_subnet_ids
  tags = {
    Name        = "${var.project_name}-${var.environment}-aws-load-balacer"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_lb_target_group" "app" {
  vpc_id      = var.vpc_id
  port        = var.app_port
  protocol    = "HTTP"
  target_type = "instance"
  health_check {
    enabled = true
    path    = "/"
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-alb-target-group"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-alb-listener"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}