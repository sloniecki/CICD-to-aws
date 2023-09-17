#vpc
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    terraform = "true"
    Name = "main"
  }
  
  
}

#Subnets in 2 availability zones

resource "aws_subnet" "main-public-1a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-north-1a"
  tags = {
    terraform = "true"
    Name = "main-public-1a"
  }
}

resource "aws_subnet" "main-public-1b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-north-1b"
  tags = {
    terraform = "true"
    Name = "main-public-1b"
  }


 
}

resource "aws_subnet" "main-private-1a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-north-1a"
  tags = {
    terraform = "true"
    Name = "main-private-1a"
  }
}

resource "aws_subnet" "main-private-1b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-north-1b"
  tags = {
    terraform = "true"
    Name = "main-private-1b"
  }
}

resource "aws_subnet" "main-private-db-a" {
  vpc_id =  aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-north-1a"
  tags = {
    terraform = "true"
    Name = "main-private-db-a"
  }
}
resource "aws_subnet" "main-private-db-b" {
  vpc_id =  aws_vpc.main.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-north-1b"
  tags = {
    terraform = "true"
    Name = "main-private-db-b"
  }
}

#internet gateway

resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    terraform = "true"
    Name = "main-gw"
  }

}
