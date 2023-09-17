resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "terraform_public_rtb"
    Tier = "public"
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id = aws_subnet.main-public-1a.id
  route_table_id = aws_route_table.public-rtb.id
}
resource "aws_route_table_association" "public2" {
  subnet_id = aws_subnet.main-public-1b.id
  route_table_id = aws_route_table.public-rtb.id
}