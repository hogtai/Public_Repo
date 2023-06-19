variable "region" {
  description = "The AWS region where resources should be created"
  default     = "us-east-2"
}

variable "windows_ami" {
  description = "The ID of the Windows Server 2019 AMI"
  default     = "ami-0d94c3e6631d82048" // Replace with your desired AMI ID
}

variable "bastion_instance_type" {
  description = "The instance type for the bastion instance"
  default     = "t3a.medium"
}

variable "bastion_instance_name" {
  description = "The instance name for the bastion instance"
  default     = "bastion1"
}

variable "bastion_volume_size" {
  description = "The volume size for the bastion instance"
  default     = 50
}

variable "key_pair_name" {
  description = "The name of the existing key pair for SSH access"
  default     = "coalfire" // Replace with your key pair name
}

variable "public_subnet" {
  description = "The ID of the public subnet where the bastion instance will be launched"
  type        = string
  default     = "subnet-0904bc13a733c1e71" # Replace with the actual default subnet ID
}

variable "security_group_id" {
  description = "The ID of the security group to attach to the EC2 instance"
  type        = string
}

