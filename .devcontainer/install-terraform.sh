#!/bin/bash

echo "== Installing Terraform"

# Descargar Terraform (versión 1.11.3)
wget -P /tmp https://releases.hashicorp.com/terraform/1.11.3/terraform_1.11.3_linux_amd64.zip

# Descomprimir y mover el binario
unzip /tmp/terraform_1.11.3_linux_amd64.zip -d /tmp
sudo mv /tmp/terraform /usr/local/bin/

# Limpiar
rm /tmp/terraform_1.11.3_linux_amd64.zip

# Verificar la instalación
terraform --version