## Create DB subnet group
resource "aws_db_subnet_group" "db_subnet" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "db-subnet-group"
  }
}

## Create RDS instance
resource "aws_db_instance" "db" {
  identifier = "blog-db"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  vpc_security_group_ids = [var.rds_sg]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name

  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = "blog-rds"
  }
}