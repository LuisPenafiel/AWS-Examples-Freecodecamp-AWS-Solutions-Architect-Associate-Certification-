terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "luis-terraform-learning"
    workspaces {
      name = "terraform-cloud-tools"
    }
  }
}

variable "mensaje" {
  type    = string
  default = "Mensaje por defecto"
}

resource "null_resource" "example" {
  triggers = {
    value = var.mensaje
  }
}

output "saludo" {
  value = "Mensaje: ${var.mensaje}"
}