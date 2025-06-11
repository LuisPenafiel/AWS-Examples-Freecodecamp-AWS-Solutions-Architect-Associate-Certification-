terraform {
  backend "s3" {
    bucket = "terraform-state-luispenafiel-2025"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
