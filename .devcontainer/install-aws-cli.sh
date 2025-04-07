#!/bin/bash
# Script para descargar e instalar AWS CLI 

# Actualizar el sistema
sudo apt-get update

# Descargar la AWS CLI v2 (versión más reciente al 24 de marzo de 2025)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Descomprimir el archivo descargado
unzip awscliv2.zip

# Instalar AWS CLI
sudo ./aws/install

# Limpiar archivos temporales
rm -rf awscliv2.zip aws

# Verificar la instalación de AWS CLI
aws --version

