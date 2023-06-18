resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = var.instance_name
  }
}

