resource "aws_instance" "bastion_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  
  // Additional configuration for the bastion instance, if needed
}

// Additional resources and configurations specific to the bastion module, if needed
