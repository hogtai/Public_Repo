output "bastion_instance_id" {
  value       = aws_instance.bastion_instance.id
  description = "The ID of the bastion instance"
}

output "bastion_public_ip" {
  value       = aws_instance.bastion_instance.public_ip
  description = "The public IP address of the bastion instance"
}

// Additional outputs specific to the bastion module, if needed
