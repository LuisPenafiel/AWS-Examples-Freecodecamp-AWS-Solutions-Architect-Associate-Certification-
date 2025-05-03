# README.txt para la carpeta s3/etags/

## ¿Qué hace esta carpeta?
Esta carpeta tiene archivos para practicar cómo usar ETags en S3 con Terraform. Los ETags son como "sellos" que identifican cada versión de un archivo.

## ¿Qué hay dentro y qué hace cada archivo?

- **main.tf**:
  Este archivo tiene el código de Terraform para crear un bucket en S3, guardar varias versiones de un archivo (myfile.txt), y usar ETags para asegurarnos de que no cambiamos el archivo por error.

- **myfile.txt**:
  Este es el archivo original que subimos al bucket. Es como un dibujo que guardamos en la caja fuerte.

- **myfile-v2.txt**:
  Este es la segunda versión del archivo. Lo cambiamos un poco para practicar cómo los ETags cambian cuando el archivo cambia.

- **myfile-v3.txt**:
  Este es la tercera versión del archivo. Usamos un ETag para asegurarnos de que solo se suba si la segunda versión no cambió.

## ¿Para qué usamos esta carpeta?
La usamos para aprender cómo los ETags nos ayudan a manejar diferentes versiones de un archivo en S3, y a asegurarnos de que no cambiamos algo por error.