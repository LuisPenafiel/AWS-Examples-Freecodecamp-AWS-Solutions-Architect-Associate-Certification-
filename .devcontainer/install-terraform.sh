#!/bin/bash

echo "== Installing Terraform"

# Instalar unzip
sudo apt update
sudo apt install unzip -y

# Descargar Terraform
wget -P /tmp https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_linux_amd64.zip

# Descomprimir y mover el binario
unzip /tmp/terraform_1.8.1_linux_amd64.zip -d /tmp
sudo mv /tmp/terraform /usr/local/bin/

# Limpiar
rm /tmp/terraform_1.8.1_linux_amd64.zip

# Verificar la instalación
terraform --version
