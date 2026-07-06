resource "random_password" "db" {
  length  = 16
  special = true
}

resource "aws_ssm_parameter" "db_password" {
  name      = "/${var.project_name}/${var.environment}/db-password"
  type      = "SecureString"
  value     = random_password.db.result
  overwrite = true
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = var.database_subnet_ids
}

resource "aws_db_instance" "mydb" {
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.db_sg_id]
  allocated_storage      = 10
  db_name                = var.db_name
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  multi_az               = false
  publicly_accessible    = false
  skip_final_snapshot    = true
  password               = random_password.db.result
  tags = {
    Name        = "${var.project_name}-${var.environment}-postgres-db"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}