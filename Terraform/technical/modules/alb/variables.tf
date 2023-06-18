variable "vpc_id" {
  description = "ID of the VPC for the ALB"
}

variable "subnet_ids" {
  description = "List of IDs of the subnets for the ALB"
  type        = list(string)
}

variable "listener_port" {
  description = "Port on which the listener should listen"
}

variable "security_group" {
  description = "Security Group ID to attach to the ALB"
}

