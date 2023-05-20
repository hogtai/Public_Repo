variable "instance_count" {
  description = "Number of EC2 instances"
  default     = 2
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the EC2 instances"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the EC2 instance names"
  type        = string
}
