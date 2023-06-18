output "subnet_ids" {
  description = "List of IDs of the created subnets"
  value       = aws_subnet.subnet[*].id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for s in aws_subnet.subnet : s.id]
}

output "wp_subnet_ids" {
  description = "The IDs of the web application subnets"
  value       = aws_subnet.subnet[*].id
}

output "db_subnet_ids" {
  description = "The IDs of the DB subnets"
  value       = aws_subnet.subnet[*].id
}

