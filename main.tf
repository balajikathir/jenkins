resource "aws_vpc" "mumbai_vpc" {
  cidr_block = var.vpc_cidr
  lifecycle {
    create_before_destroy = true
  }
 tags = {
    Name = "america_vpc"
  }
}

resource "aws_subnet" "pri_subnet" {
  vpc_id     = aws_vpc.mumbai_vpc.id
  cidr_block = var.private_subnet

  tags = {
    Name = "pri_subnet"
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.mumbai_vpc.id
  cidr_block = var.public_subnet

  tags = {
    Name = "pub_subnet"
  }
}


variable "vpc_cidr" {
  default = "12.0.0.0/16"
}

variable "private_subnet" {
  default = "12.0.1.0/24"
}

variable "public_subnet" {
  default = "12.0.2.0/24"
}
