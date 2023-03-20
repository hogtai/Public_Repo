provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "terraform-tait" {
  ami           = "ami-05502a22127df2492"
  instance_type = "t2.micro"
  key_name      = "Project18-KeyPair"
  
  tags = {
    Name = "terraform-tait"
  }
}
