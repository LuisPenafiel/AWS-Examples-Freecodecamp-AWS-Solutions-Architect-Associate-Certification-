terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "luis-terraform-learning"
    workspaces {
      name = "terraform-cloud-tools"
    }
  }
}

variable "TF_VAR_mensaje" {
  type        = string
  default     = "Mensaje por defecto"
  description = "Un mensaje personalizado para la salida"
}

variable "TF_VAR_secreto" {
  type        = string
  sensitive   = true
  description = "Un secreto sensible para pruebas"
}

variable "TF_VAR_server_name" {
  type        = string
  default     = "local-server-01"
  description = "Nombre del servidor local"
}

variable "TF_VAR_cloud_name" {
  type        = string
  default     = "cloud-server-01"
  description = "Nombre del servidor en la nube virtual"
}

module "local" {
  source     = "../modules/local_server"
  server_name = var.TF_VAR_server_name
}

module "cloud" {
  source     = "../modules/cloud_server"
  cloud_name = var.TF_VAR_cloud_name
}

resource "null_resource" "example" {
  triggers = {
    value  = var.TF_VAR_mensaje
    secret = var.TF_VAR_secreto
  }
}

output "saludo" {
  value    = "Mensaje: ${var.TF_VAR_mensaje}, Secreto: ${var.TF_VAR_secreto}"
  sensitive = true
}

output "hybrid_infrastructure" {
  value = "Local: ${module.local.local_server_name}, Cloud: ${module.cloud.cloud_server_name}"
}