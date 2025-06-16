locals {
  subnet_count = 1
  vpc_name     = "my-vpc-day03"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = local.vpc_name
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = "${local.vpc_name}-subnet"
  }
}
