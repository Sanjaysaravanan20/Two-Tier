resource "aws_vpc" "my_vpc" {
  
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr
}

resource "aws_subnet" "private_app" {
  
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.private_app_subnet_cidr
}

resource "aws_subnet" "private_db" {
  
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.private_db_subnet_cidr
}

resource "aws_internet_gateway" "igw" {
  
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_eip" "nat" {
  
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public.id
}

resource "aws_route_table" "public" {
  
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "public_internet_access" {
  
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}