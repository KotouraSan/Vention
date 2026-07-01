resource "aws_db_subnet_group" "main" {
  name = "main"
  subnet_ids = var.database_subnet_ids
}

resource "aws_db_instance" "mydb" {
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.db_sg_id]
  allocated_storage = 10
  db_name = var.db_name
  engine = "postgres"
  instance_class = "db.t3.micro"
  username = var.db_username
  multi_az = false
  publicly_accessible = false
  skip_final_snapshot = true
  password = var.db_password
}