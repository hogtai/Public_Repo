resource "aws_instance" "ec2_instances" {
  count         = var.count
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  tags = {
    Name = "${var.name_prefix}-instance-${count.index + 1}"
  }
}

output "ec2_instance_ids" {
  value = aws_instance.ec2_instance.*.id

}
