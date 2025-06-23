variable "instance_type" {
  description = "Tipo de chef (instancia EC2)"
  type        = string
  default     = "t3.micro"  # Un chef pequeño y eficiente
}

variable "ami_id" {
  description = "Receta base (AMI) para el chef"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Una AMI de Ubuntu en eu-central-1, verifica en la consola
}

variable "desired_capacity" {
  description = "Número de chefs que quieres al inicio"
  type        = number
  default     = 1  # Un chef para empezar
}

variable "min_size" {
  description = "Mínimo de chefs en el equipo"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Máximo de chefs si hay muchos clientes"
  type        = number
  default     = 2
}

variable "vpc_cidr" {
  description = "Zona del restaurante (rango de IPs de la VPC)"
  type        = string
  default     = "10.2.0.0/16"
}

variable "public_subnets" {
  description = "Áreas públicas del restaurante (subredes públicas)"
  type        = list(string)
  default     = ["10.2.1.0/24", "10.2.2.0/24"]
}
