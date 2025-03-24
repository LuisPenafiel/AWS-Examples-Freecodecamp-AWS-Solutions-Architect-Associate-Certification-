#!/bin/bash
# Script para descargar e instalar AWS CLI en un Codespace

# Actualizar el sistema
sudo apt-get update

# Instalar dependencias necesarias (como unzip)
sudo apt-get install -y unzip

# Descargar la AWS CLI v2 (versión más reciente al 24 de marzo de 2025)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Descomprimir el archivo descargado
unzip awscliv2.zip

# Instalar AWS CLI
sudo ./aws/install

# Limpiar archivos temporales
rm -rf awscliv2.zip aws

# Verificar la instalación
aws --version