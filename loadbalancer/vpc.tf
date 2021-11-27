# Vpc
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name        = "first-vpc"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}

#Subnet
resource "aws_subnet" "main_public" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-2a"
  cidr_block              = "10.0.1.0/24"

  tags = {
    Name        = "first-public-subnet-A"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}
resource "aws_subnet" "main_private" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-west-2b"
  cidr_block        = "10.0.2.0/24"

  tags = {
    Name        = "first-private-subnet-B"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}
#IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "first-Igw"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}

#Route Table
resource "aws_route_table" "main-rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "first-routetable"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}

#Route Table Association
resource "aws_route_table_association" "route-assocaition" {
  subnet_id      = aws_subnet.main_public.id
  route_table_id = aws_route_table.main-rtb.id
}