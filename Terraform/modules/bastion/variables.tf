variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) for the bastion instance"
}

variable "instance_type" {
  description = "The EC2 instance type for the bastion instance"
}

variable "key_name" {
  description = "The name of the SSH key pair for accessing the bastion instance"
}

variable "security_group_id" {
  description = "The ID of the security group for the bastion instance"
}

// Additional variables specific to the bastion module, if needed
