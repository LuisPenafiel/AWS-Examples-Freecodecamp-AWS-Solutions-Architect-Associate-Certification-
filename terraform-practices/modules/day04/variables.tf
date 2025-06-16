variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
  default     = "my-vpc-day04"
}

variable "vpc_cidr" {
  description = "Rango CIDR principal de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Lista de CIDR para subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Lista de CIDR para subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}
