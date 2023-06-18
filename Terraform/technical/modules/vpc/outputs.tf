output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = aws_subnet.main.id
}

output "route_table_id" {
  description = "The ID of the Route Table"
  value       = aws_route_table.main.id
}

output "internet_route" {
  description = "The route for internet access"
  value       = aws_route.internet_access.id
}

