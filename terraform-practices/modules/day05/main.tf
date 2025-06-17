data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["my-vpc-day03"]
  }
}

data "aws_subnets" "available" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

resource "aws_db_instance" "my_rds" {
  engine            = var.db_engine
  engine_version    = "5.7.44"
  instance_class    = var.db_instance_class
  allocated_storage = 20
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Security group for RDS"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip != null ? [var.allowed_ip] : [""0.0.0.0/0""]  # Usa IP si está definida
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = data.aws_subnets.available.ids
}