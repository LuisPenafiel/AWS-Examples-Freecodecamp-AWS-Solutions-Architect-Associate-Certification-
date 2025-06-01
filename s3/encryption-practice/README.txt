# README.txt para la carpeta s3/encryption-practice/

## ¿Qué hace esta carpeta?
Esta carpeta tiene archivos para practicar cómo usar encriptación en S3 con Terraform y con comandos de AWS CLI. La encriptación es como ponerle un candado a mis archivos para que nadie los vea sin permiso.

## ¿Qué hay dentro y qué hace cada archivo?

- **main.tf**:
  Este archivo tiene el código de Terraform para crear un bucket (encryption-fun-ab-135-luispenafiel-2025) y subir un archivo (hello.txt) dos veces con diferentes tipos de encriptación: SSE-S3 (un candado simple) y SSE-KMS (un candado con una llave especial). Intentamos usar SSE-C (un candado con mi propia llave), pero Terraform no lo soporta, así que usamos AWS CLI para esa parte.

- **hello.txt**:
  Este es el archivo que subimos al bucket. Es como un dibujo que dice "Hello World" y que protegemos con encriptación.

- **ssec.key**:
  Este archivo tiene la llave que usamos para la encriptación SSE-C. Es como la llave de mi candado que yo mismo hice.

## ¿Para qué usamos esta carpeta?
La usamos para aprender cómo proteger mis archivos en S3 usando diferentes tipos de candados (encriptación). Probamos tres formas: SSE-S3 (S3 pone el candado por mí), SSE-KMS (S3 usa una llave especial), y SSE-C (yo pongo mi propia llave). Hicimos SSE-S3 y SSE-KMS con Terraform, pero SSE-C lo hicimos con comandos en la terminal porque Terraform no lo soporta.

## ¿Cómo hacer esta práctica con AWS CLI en Codespaces?
Aquí están los comandos para hacer lo mismo que hicimos con Terraform, pero usando AWS CLI directamente en la terminal. Estos comandos son como hablarle a S3 sin usar un control remoto (Terraform).

### Crear el bucket

```sh
aws s3 mb s3://encryption-fun-ab-135-luispenafiel-2025 --region eu-central-1```

### Subir el archivo con encriptación SSE-S3

```sh
aws s3 cp hello.txt s3://encryption-fun-ab-135-luispenafiel-2025/hello-sse-s3.txt --sse AES256 --region eu-central-1```

### Subir el archivo con encriptación SSE-KMS (usando la llave por defecto de AWS/S3)

```sh
aws s3api put-object \
--bucket encryption-fun-ab-135-luispenafiel-2025 \
--key hello-sse-kms.txt \
--body hello.txt \
--server-side-encryption "aws:kms" \
--region eu-central-1```

### Subir el archivo con encriptación SSE-C

Primero, crea una llave para SSE-C (si no la tienes):

```sh
openssl rand -out ssec.key 32```

Luego, sube el archivo:

```sh
aws s3 cp hello.txt s3://encryption-fun-ab-135-luispenafiel-2025/hello-sse-c.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key \
--region eu-central-1```

### Descargar el archivo con SSE-C para verificar

```sh
aws s3 cp s3://encryption-fun-ab-135-luispenafiel-2025/hello-sse-c.txt hello-sse-c-downloaded.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key \
--region eu-central-1```

### Verificar la encriptación de los archivos
Para SSE-S3:

```sh
aws s3api head-object --bucket encryption-fun-ab-135-luispenafiel-2025 --key hello-sse-s3.txt --region eu-central-1```

Para SSE-KMS:
```sh
aws s3api head-object --bucket encryption-fun-ab-135-luispenafiel-2025 --key hello-sse-kms.txt --region eu-central-1```

Para SSE-C (necesitas la llave en base64):
Primero, codifica la llave en base64:

```sh
KEY_BASE64=$(cat ssec.key | base64)
echo $KEY_BASE64```

Calcula el MD5 de la llave binaria (no de la llave en base64):
```sh
KEY_MD5=$(md5sum ssec.key | awk '{print $1}' | xxd -r -p | base64)
echo $KEY_MD5```

Luego, verifica el archivo:

```sh
aws s3api head-object \
--bucket encryption-fun-ab-135-luispenafiel-2025 \
--key hello-sse-c.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key "$KEY_BASE64" \
--sse-customer-key-md5 "$KEY_MD5" \
--region eu-central-1```

### Limpiar los recursos
Borra los archivos y el bucket cuando termines:

```sh
aws s3 rm s3://encryption-fun-ab-135-luispenafiel-2025/hello-sse-s3.txt --region eu-central-1
aws s3 rm s3://encryption-fun-ab-135-luispenafiel-2025/hello-sse-kms.txt --region eu-central-1
aws s3 rm s3://encryption-fun-ab-135-luispenafiel-2025/hello-sse-c.txt --sse-c AES256 --sse-c-key fileb://ssec.key --region eu-central-1
aws s3 rb s3://encryption-fun-ab-135-luispenafiel-2025 --region eu-central-1```