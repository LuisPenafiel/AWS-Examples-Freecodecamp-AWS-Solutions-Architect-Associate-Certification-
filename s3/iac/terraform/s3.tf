resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "my-terraform-bucket-luispenafiel-2025"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day10"
  }
}