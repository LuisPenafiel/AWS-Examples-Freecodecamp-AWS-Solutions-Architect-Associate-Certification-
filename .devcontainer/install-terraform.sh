#!/bin/bash

echo "== Installing Terraform"

# Descargar Terraform (versión 1.11.4)
wget -P /tmp https://releases.hashicorp.com/terraform/1.11.4/terraform_1.11.4_linux_amd64.zip || { echo "Error downloading Terraform"; exit 1; }

# Descomprimir y mover el binario
unzip /tmp/terraform_1.11.4_linux_amd64.zip -d /tmp || { echo "Error unzipping Terraform"; exit 1; }
sudo mv /tmp/terraform /usr/local/bin/ || { echo "Error moving Terraform binary"; exit 1; }

# Limpiar
rm /tmp/terraform_1.11.4_linux_amd64.zip || { echo "Error cleaning up"; exit 1; }

# Verificar la instalación
terraform --version || { echo "Error verifying Terraform installation"; exit 1; }