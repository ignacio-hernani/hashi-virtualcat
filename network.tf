resource "aws_vpc" "hashicat" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    name        = "${random_string.preffix.result}-vpc"
    environment = "Production"
  }
}

resource "aws_internet_gateway" "hashicat" {
  vpc_id = aws_vpc.hashicat.id

  tags = {
    Name = "${random_string.preffix.result}-internet-gateway"
  }
}

resource "aws_subnet" "hashicat" {
  vpc_id     = aws_vpc.hashicat.id
  cidr_block = "10.0.10.0/24"

  tags = {
    name = "${random_string.preffix.result}-subnet"
  }
}

#resource "aws_subnet" "static_subnet" {
#  vpc_id     = aws_vpc.hashicat.id
#  cidr_block = "10.100.10.0/24"
#
#  tags = {
#    name = "${random_string.preffix.result}-static-subnet"
#  }
#}

resource "aws_route_table" "hashicat" {
  vpc_id = aws_vpc.hashicat.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hashicat.id
  }
}

resource "aws_route_table_association" "hashicat" {
  subnet_id      = aws_subnet.hashicat.id
  route_table_id = aws_route_table.hashicat.id
}

resource "aws_eip" "hashicat" {
  instance = aws_instance.hashicat.id
  domain   = "vpc"
}

resource "aws_eip_association" "hashicat" {
  instance_id   = aws_instance.hashicat.id
  allocation_id = aws_eip.hashicat.id
}
