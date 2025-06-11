provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-luispenafiel-2025"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

variable "bucket_name" {
  description = "Nombre único del bucket S3"
  type        = string
}

variable "allowed_ip" {
  description = "IP permitida para acceder al bucket"
  type        = string
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
        Condition = {
          IpAddress = {
            "aws:SourceIp" = var.allowed_ip
          }
        }
      }
    ]
  })
}

output "bucket_name_output" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "bucket_arn_output" {
  value = aws_s3_bucket.my_bucket.arn
}