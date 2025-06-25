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
    value = "Testing GitHub Trigger Fix - Attempt 3"
  }
}

#pruebas