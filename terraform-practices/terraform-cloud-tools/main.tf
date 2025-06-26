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
  type    = string
  default = "Mensaje por defecto"
  description = "Un mensaje personalizado para la salida"
}

variable "TF_VAR_secreto" {
  type      = string
  sensitive = true
  description = "Un secreto sensible para pruebas"
}

resource "null_resource" "example" {
  triggers = {
    value  = var.TF_VAR_mensaje
    secret = var.TF_VAR_secreto
    environment = "test"
  }
}
output "saludo" {
  value    = "Mensaje: ${var.TF_VAR_mensaje}, Secreto: ${var.TF_VAR_secreto}"
  sensitive = true
}