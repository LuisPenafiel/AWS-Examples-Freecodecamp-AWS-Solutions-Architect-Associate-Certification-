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

# Crear un bucket de S3
resource "aws_s3_bucket" "my-bucket" {
  bucket = "checksum-sha1-luispenafiel-2025"

  tags = {
    Name        = "Checksum SHA-1 Practice Bucket"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day13"
  }
}

# Subir el archivo con checksum SHA-1
resource "aws_s3_object" "my-object" {
  bucket             = aws_s3_bucket.my-bucket.id
  key                = "example.txt"
  source             = "example.txt"
  checksum_algorithm = "SHA1"              

  tags = {
    Name        = "Example File with SHA-1 Checksum"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day13"
  }
}

# Exportar el checksum SHA-1 calculado por S3
output "s3_checksum_sha1" {
  value = aws_s3_object.my-object.checksum_sha1
}

# Exportar el checksum SHA-1 calculado localmente (para comparación)
output "local_checksum_sha1" {
  value = base64encode(filesha1("example.txt"))
}