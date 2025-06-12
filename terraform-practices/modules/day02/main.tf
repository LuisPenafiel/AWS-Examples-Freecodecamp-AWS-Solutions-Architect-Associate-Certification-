resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data     = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Bienvenido a mi servidor web - Día 2</h1>" > /var/www/html/index.html
    EOF
  tags = {
    Name = "WebServer-Day02"
  }
}

output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}
