variable "cloud_name" {
  type    = string
  default = "cloud-server"
}

resource "null_resource" "cloud" {
  triggers = {
    name = var.cloud_name
    status = "running"
  }
}

output "cloud_server_name" {
  value = var.cloud_name
}
