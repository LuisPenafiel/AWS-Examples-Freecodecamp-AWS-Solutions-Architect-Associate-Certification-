resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone = element(["eu-central-1a", "eu-central-1b"], count.index)
  tags = {
    Name = "${var.vpc_name}-public-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count      = length(var.private_subnets)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = element(["eu-central-1a", "eu-central-1b"], count.index)
  tags = {
    Name = "${var.vpc_name}-private-${count.index + 1}"
  }
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}
