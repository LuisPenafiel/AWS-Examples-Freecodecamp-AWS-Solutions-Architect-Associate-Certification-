#!/bin/bash

# Instalar dependencias necesarias para Ruby
sudo apt update
sudo apt install -y ruby-full

# Instalar utilidades comunes (equivalente a ghcr.io/devcontainers/common-utils)
sudo apt-get install -y unzip tree curl git vim nano wget

# Verifica que todo se instaló correctamente
ruby --version && tree --version && curl --version && git --version && aws --version