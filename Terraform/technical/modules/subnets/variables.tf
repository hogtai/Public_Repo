variable "vpc_id" {
  description = "The ID of the VPC in which to create the subnets"
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Whether to enable auto-assign public IP on instances"
  default     = false
}

variable "availability_zones" {
  description = "List of availability zones in which to create the subnets"
  type        = list(string)
}

variable "subnet_names" {
  description = "List of names for the subnets"
  type        = list(string)
}

