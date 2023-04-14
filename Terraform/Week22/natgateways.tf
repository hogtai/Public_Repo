resource "aws_eip" "nat_eip1" {
  vpc = true

  tags = {
    Name = var.nat_eip1_name_tag
  }
}

resource "aws_nat_gateway" "public_subnet1_nat_gateway" {
  allocation_id = aws_eip.nat_eip1.id
  subnet_id     = aws_subnet.public_subnet1_project21.id

  tags = {
    Name = var.nat_gateway1_name_tag
  }
}

resource "aws_eip" "nat_eip2" {
  vpc = true

  tags = {
    Name = var.nat_eip2_name_tag
  }
}

resource "aws_nat_gateway" "public_subnet2_nat_gateway" {
  allocation_id = aws_eip.nat_eip2.id
  subnet_id     = aws_subnet.public_subnet2_project21.id

  tags = {
    Name = var.nat_gateway2_name_tag
  }
}
