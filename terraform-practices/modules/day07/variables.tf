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