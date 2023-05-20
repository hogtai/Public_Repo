output "ec2_instance_private_ips" {
  value = aws_instance.ec2_instance.*.private_ip
}
