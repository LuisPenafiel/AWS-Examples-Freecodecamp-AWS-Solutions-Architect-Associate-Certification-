variable "server_name" {
  type    = string
  default = "local-server"
}

resource "null_resource" "local" {
  triggers = {
    name = var.server_name
    status = "running"
  }
}

output "local_server_name" {
  value = var.server_name
}
