#!/bin/bash

# Instalar utilidades comunes (equivalente a ghcr.io/devcontainers/common-utils)
sudo apt update
sudo apt-get install -y unzip tree curl git vim nano wget

# Verifica que todo se instaló correctamente
tree --version && curl --version && git --version && aws --version && terraform --version