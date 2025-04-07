#!/bin/bash

# Instalar dependencias necesarias para java y ruby
sudo apt update
sudo apt install -y openjdk-17-jdk ruby-full

# Instalar dependencias necesarias (como unzip) y tree
sudo apt-get install -y unzip tree

# Verifica que todo se instaló correctamente
java --version && ruby --version && tree --version