terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "luis-terraform-learning"
    workspaces {
      name = "day07"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

variable "instance_type" {
  description = "Tipo de instancia EC2 (como el tamaño de los cocineros)"
  type        = string
  default     = "t3.micro"  # Dentro del Free Tier
}

variable "ami_id" {
  description = "ID de la AMI (receta base para los cocineros)"
  type        = string
  default     = "ami-000ec6c25978d5999"  # Amazon Linux 2 x86 en eu-central-1
}

variable "vpc_cidr" {
  description = "Rango de IPs para la zona del restaurante (VPC)"
  type        = string
  default     = "10.2.0.0/16"
}

variable "public_subnets" {
  description = "Áreas públicas donde trabajarán los cocineros (subredes)"
  type        = list(string)
  default     = ["10.2.1.0/24", "10.2.2.0/24"]
}

# Crear la zona del restaurante (VPC)
resource "aws_vpc" "day07_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "day07-vpc"
  }
}

# Crear las áreas públicas (subredes públicas)
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.day07_vpc.id
  cidr_block        = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone = element(["eu-central-1a", "eu-central-1b"], count.index)
  tags = {
    Name = "day07-public-${count.index + 1}"
  }
}

# Crear la puerta de entrada (Internet Gateway)
resource "aws_internet_gateway" "day07_igw" {
  vpc_id = aws_vpc.day07_vpc.id
  tags = {
    Name = "day07-igw"
  }
}

# Crear el mapa de rutas (Route Table)
resource "aws_route_table" "day07_route_table" {
  vpc_id = aws_vpc.day07_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.day07_igw.id
  }
  tags = {
    Name = "day07-route-table"
  }
}

# Conectar el mapa de rutas a las subredes
resource "aws_route_table_association" "day07_association" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.day07_route_table.id
}

# Crear el grupo de seguridad para permitir HTTP
resource "aws_security_group" "web_sg" {
  name        = "day07-web-sg"
  description = "Permitir tráfico HTTP"
  vpc_id      = aws_vpc.day07_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "day07-web-sg"
  }
}

# Crear las instancias EC2 (cocineros)
resource "aws_instance" "web" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(aws_subnet.public_subnets[*].id, count.index)
  security_groups = [aws_security_group.web_sg.id]
  user_data     = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Bienvenido a mi Restaurante Mágico - Luis Peñafiel</h1>" > /var/www/html/index.html
    EOF
  )

  tags = {
    Name = "day07-web-${count.index + 1}"
  }
}

# Crear el Target Group para el ALB
resource "aws_lb_target_group" "day07_tg" {
  name     = "day07-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.day07_vpc.id
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 30
    timeout = 5
  }
}

# Registrar las instancias en el Target Group
resource "aws_lb_target_group_attachment" "day07_attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.day07_tg.arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
}

# Crear el Application Load Balancer
resource "aws_lb" "day07_alb" {
  name               = "day07-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = aws_subnet.public_subnets[*].id
  enable_deletion_protection = false

  tags = {
    Name = "day07-alb"
  }
}

# Crear el Listener para el ALB
resource "aws_lb_listener" "day07_listener" {
  load_balancer_arn = aws_lb.day07_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.day07_tg.arn
  }
}

# Mostrar los resultados (outputs)
output "vpc_id" {
  value = aws_vpc.day07_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "alb_dns_name" {
  value = aws_lb.day07_alb.dns_name
}

output "instance_ids" {
  value = aws_instance.web[*].id
}