# Crear la zona del restaurante (VPC)
resource "aws_vpc" "day07_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "day07-vpc"  # Nombre de la zona
  }
}

# Crear las áreas públicas del restaurante (subredes públicas)
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.day07_vpc.id
  cidr_block        = var.public_subnets[count.index]
  map_public_ip_on_launch = true  # Los chefs tienen acceso directo a clientes
  availability_zone = element(["eu-central-1a", "eu-central-1b"], count.index)  # Dos zonas para seguridad
  tags = {
    Name = "day07-public-${count.index + 1}"  # Área 1 y 2
  }
}

# Crear la puerta de entrada al restaurante (Internet Gateway)
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
    cidr_block = "0.0.0.0/0"  # Ruta a cualquier cliente
    gateway_id = aws_internet_gateway.day07_igw.id
  }
  tags = {
    Name = "day07-route-table"
  }
}

# Conectar el mapa de rutas a las áreas públicas
resource "aws_route_table_association" "day07_association" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.day07_route_table.id
}

# Crear la receta del chef (Launch Template)
resource "aws_launch_template" "day07_launch_template" {
  name_prefix   = "day07-template"
  image_id      = var.ami_id  # Ingrediente base
  instance_type = var.instance_type  # Tipo de chef
  user_data     = base64encode("#!/bin/bash\napt-get update -y\napt-get install -y apache2\nsystemctl start apache2\nsystemctl enable apache2\necho '<h1>Welcome to my Magic Restaurant!</h1>' > /var/www/html/index.html")
  tags = {
    Name = "day07-launch-template"
  }
}

# Crear el equipo de chefs (Auto Scaling Group)
resource "aws_autoscaling_group" "day07_asg" {
  vpc_zone_identifier = aws_subnet.public_subnets[*].id  # Áreas donde trabajan
  target_group_arns   = []  # Sin grupo de destino por ahora
  health_check_type   = "EC2"  # Revisión de salud
  desired_capacity    = var.desired_capacity  # 1 chef al inicio
  min_size            = var.min_size  # Mínimo 1 chef
  max_size            = var.max_size  # Máximo 2 chefs
  launch_template {
    id      = aws_launch_template.day07_launch_template.id
    version = "$Latest"  # Usa la última receta
  }
  tags = [
    {
      key                 = "Name"
      value               = "day07-asg-instance"
      propagate_at_launch = true
    }
  ]
}

# Mostrar los resultados (outputs)
output "vpc_id" {
  value = aws_vpc.day07_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "asg_name" {
  value = aws_autoscaling_group.day07_asg.name
}
