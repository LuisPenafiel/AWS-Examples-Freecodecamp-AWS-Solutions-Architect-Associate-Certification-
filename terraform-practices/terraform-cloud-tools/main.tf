terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "luis-terraform-learning"
    workspaces {
      name = "terraform-cloud-tools"
    }
  }
}

resource "null_resource" "example" {
  triggers = {
    value = "Fixed GitHub Integration Test"
  }
}

#Prueba que funcione