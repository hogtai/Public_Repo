output "bastion_instance_id" {
  description = "The ID of the bastion instance"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "The public IP address of the bastion instance"
  value       = aws_instance.bastion.public_ip
}

