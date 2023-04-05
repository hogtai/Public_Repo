resource "aws_route" "public_route_table_internet_gateway" {
  route_table_id         = aws_route_table.project21_vpc_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.project_21_internet_gateway.id
}
