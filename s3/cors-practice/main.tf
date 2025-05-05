terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

# Crear el primer bucket (para el sitio web)
resource "aws_s3_bucket" "website-bucket" {
  bucket = "cors-fun-ab-36252-luispenafiel-2025"

  tags = {
    Name        = "CORS Website Bucket"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day14"
  }
}

# Desactivar bloqueo de acceso público para el primer bucket
resource "aws_s3_bucket_public_access_block" "website-bucket-access" {
  bucket = aws_s3_bucket.website-bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

# Configurar el bucket como sitio web estático
resource "aws_s3_bucket_website_configuration" "website-bucket-config" {
  bucket = aws_s3_bucket.website-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Configurar la política del primer bucket
resource "aws_s3_bucket_policy" "website-bucket-policy" {
  bucket = aws_s3_bucket.website-bucket.id
  policy = file("bucket-policy.json")

  depends_on = [aws_s3_bucket_public_access_block.website-bucket-access]
}

# Configurar CORS para el primer bucket
resource "aws_s3_bucket_cors_configuration" "website-bucket-cors" {
  bucket = aws_s3_bucket.website-bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["https://1kccnjkm43.execute-api.ca-central-1.amazonaws.com"]
    expose_headers  = ["x-amz-server-side-encryption"]
    max_age_seconds = 3000
  }
}

# Subir index.html al primer bucket
resource "aws_s3_object" "index-html" {
  bucket       = aws_s3_bucket.website-bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"

  tags = {
    Name        = "Index Page for Website"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day14"
  }
}

# Crear el segundo bucket (para hello.js)
resource "aws_s3_bucket" "js-bucket" {
  bucket = "cors-fun2-ab-36252-luispenafiel-2025"

  tags = {
    Name        = "CORS JavaScript Bucket"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day14"
  }
}

# Desactivar bloqueo de acceso público para el segundo bucket
resource "aws_s3_bucket_public_access_block" "js-bucket-access" {
  bucket = aws_s3_bucket.js-bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

# Configurar el segundo bucket como sitio web estático
resource "aws_s3_bucket_website_configuration" "js-bucket-config" {
  bucket = aws_s3_bucket.js-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Configurar la política del segundo bucket
resource "aws_s3_bucket_policy" "js-bucket-policy" {
  bucket = aws_s3_bucket.js-bucket.id
  policy = file("bucket-policy2.json")

  depends_on = [aws_s3_bucket_public_access_block.js-bucket-access]
}

# Configurar CORS para el segundo bucket
resource "aws_s3_bucket_cors_configuration" "js-bucket-cors" {
  bucket = aws_s3_bucket.js-bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["http://cors-fun-ab-36252-luispenafiel-2025.s3-website.eu-central-1.amazonaws.com"]
    max_age_seconds = 3000
  }
}

# Subir hello.js al segundo bucket
resource "aws_s3_object" "hello-js" {
  bucket       = aws_s3_bucket.js-bucket.id
  key          = "hello.js"
  source       = "hello.js"
  content_type = "application/javascript"

  tags = {
    Name        = "Hello JavaScript File"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day14"
  }
}

# Exportar las URLs de los sitios web
output "website_url" {
  value = "http://cors-fun-ab-36252-luispenafiel-2025.s3-website.eu-central-1.amazonaws.com"
}

output "js_bucket_url" {
  value = "http://cors-fun2-ab-36252-luispenafiel-2025.s3-website.eu-central-1.amazonaws.com"
}
