# README.txt para la carpeta s3/cors-practice/

## ¿Qué hace esta carpeta?
Esta carpeta tiene archivos para practicar cómo usar CORS en S3 con Terraform. CORS es como darle permiso a un sitio web para hablar con otra página web (como una API).

## ¿Qué hay dentro y qué hace cada archivo?

- **main.tf**:
  Este archivo tiene el código de Terraform para crear dos buckets: uno para un sitio web (cors-fun-ab-36252-luispenafiel-2025) y otro para un archivo JavaScript (cors-fun2-ab-36252-luispenafiel-2025). Configura los buckets como sitios web, añade permisos para que todos puedan verlos, y pone reglas CORS en ambos buckets para que el primero pueda usar el archivo del segundo.

- **index.html**:
  Este es el archivo principal del sitio web que subimos al primer bucket. Es como un cuaderno que muestra una página web que dice "Welcome to My Website". También intenta hablar con una API y carga un archivo JavaScript (hello.js) desde el segundo bucket.

- **hello.js**:
  Este es un archivo JavaScript que subimos al segundo bucket. Es como un pequeño programa que dice "hello world".

- **bucket-policy.json**:
  Este archivo tiene permisos para el primer bucket, para que todos puedan ver el sitio web.

- **bucket-policy2.json**:
  Este archivo tiene permisos para el segundo bucket, para que todos puedan ver el archivo JavaScript.

- **cors.json**:
  Este archivo tiene las reglas CORS para el primer bucket, para que el sitio web pueda hablar con una API (como pedir información a otra página web).

- **website.json**:
  Este archivo configura los buckets como sitios web, diciendo que index.html es la página principal.

## ¿Para qué usamos esta carpeta?
La usamos para aprender cómo hacer un sitio web en S3 y darle permiso (con CORS) para hablar con otra página web, asegurándonos de que sea seguro. Probamos CORS haciendo que el sitio web cargue el archivo hello.js desde el segundo bucket, y vimos que funcionó (mostró "hello world" en la consola). Hubo dos errores en la consola: uno porque la API no estaba disponible (lo cual es normal porque no la creamos), y otro de un script de Cloudflare que no necesitamos. La práctica está completa porque probamos CORS con éxito.

## ¿Cómo hacer esta práctica con AWS CLI en Codespaces?
Aquí están los comandos para hacer lo mismo que hicimos con Terraform, pero usando AWS CLI directamente en la terminal. Estos comandos son como hablarle a S3 sin usar un control remoto (Terraform).

----------------------------------------


## Create a bucket

```sh
aws s3 mb s3://cors-fun-ab-36252-luispenafiel-2025 --region eu-central-1
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-fun-ab-36252-luispenafiel-2025 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false" \
--region eu-central-1"
```

## Create 1 bucket policy

```sh
aws s3api put-bucket-policy \
--bucket cors-fun-ab-36252-luispenafiel-2025 \
--policy file://bucket-policy.json \
--region eu-central-1
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website \
--bucket cors-fun-ab-36252-luispenafiel-2025 \
--website-configuration file://website.json \
--region eu-central-1
```

## Upload our index.html file and include a resource that would be cross-origin

aws s3 cp index.html s3://cors-fun-ab-36252-luispenafiel-2025 --region eu-central-1

## View the website and see if the index.html is there.

http://cors-fun-ab-36252-luispenafiel-2025.s3-website.eu-central-1.amazonaws.com


# Create Website 2

```sh
aws s3 mb s3://cors-fun2-ab-36252-luispenafiel-2025 --region eu-central-1
```

## Change block public access for 2 bucket

```sh
aws s3api put-public-access-block \
--bucket cors-fun2-ab-36252-luispenafiel-2025 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false" \
--region eu-central-1
```

## Create 2 bucket policy

```sh
aws s3api put-bucket-policy \
--bucket cors-fun2-ab-36252-luispenafiel-2025 \
--policy file://bucket-policy2.json \
--region eu-central-1
```

## Turn on static website hosting for 2 bucket

```sh
aws s3api put-bucket-website \
--bucket cors-fun2-ab-36252-luispenafiel-2025 \
--website-configuration file://website.json \
--region eu-central-1
```

## Upload our javascript file

```sh
aws s3 cp hello.js s3://cors-fun2-ab-36252-luispenafiel-2025 --region eu-central-1
```

## Create API Gateway with mock response and then test the endpoint

```sh
caws s3api put-bucket-cors \
--bucket cors-fun-ab-36252-luispenafiel-2025 \
--cors-configuration file://cors.json \
--region eu-central-1
```

## Set CORS on our bucket

```sh
aws s3api put-bucket-cors \
--bucket cors-fun2-ab-36252-luispenafiel-2025 \
--cors-configuration '{"CORSRules":[{"AllowedOrigins":["http://cors-fun-ab-36252-luispenafiel-2025.s3-website.eu-central-1.amazonaws.com"],"AllowedMethods":["GET"],"AllowedHeaders":["*"],"MaxAgeSeconds":3000}]}' \
--region eu-central-1
```