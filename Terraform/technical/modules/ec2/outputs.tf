output "instance_id" {
  description = "The ID of the created instance"
  value       = aws_instance.instance.id
}

output "public_ip" {
  description = "The public IP of the created instance"
  value       = aws_instance.instance.public_ip
}

output "private_ip" {
  description = "The private IP of the created instance"
  value       = aws_instance.instance.private_ip
}

