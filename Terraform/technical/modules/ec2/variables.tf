variable "ami" {
  description = "The ID of the AMI to use"
}

variable "instance_type" {
  description = "The instance type to use for the instance"
}

variable "subnet_id" {
  description = "The ID of the subnet where the instance will be created"
}

variable "volume_size" {
  description = "The size of the root volume in GB"
}

variable "instance_name" {
  description = "The name to assign to the instance"
}

