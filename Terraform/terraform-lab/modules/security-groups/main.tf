resource "aws_security_group" "alb" {
  name = "ALB-SG"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-alb"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_80" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  ip_protocol = "tcp"
  to_port = 80

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-alb"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc_security_group_egress_rule" "alb" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = -1

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-alb"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_443" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 443
  ip_protocol = "tcp"
  to_port = 443

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-alb"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_security_group" "app" {
  name = "APP-SG"
  vpc_id = var.vpc_id
  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-app"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_8080" {
  security_group_id = aws_security_group.app.id
  from_port = var.app_port
  to_port = var.app_port
  ip_protocol = "tcp"
  referenced_security_group_id = aws_security_group.alb.id
  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-app"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc_security_group_egress_rule" "app_sg" {
  security_group_id = aws_security_group.app.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = -1

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-app"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_security_group" "db" {
  name = "DB-SG"
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-db"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "db" {
  security_group_id = aws_security_group.db.id
  from_port = var.db_port
  to_port = var.db_port
  ip_protocol = "tcp"
  referenced_security_group_id = aws_security_group.app.id
  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-db"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_vpc_security_group_egress_rule" "db_sg" {
  security_group_id = aws_security_group.db.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = -1

  tags = {
    Name        = "${var.project_name}-${var.environment}-sg-db"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}