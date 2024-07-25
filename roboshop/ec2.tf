resource "aws_instance" "web" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-03ec8b1ac2604e9da"]
  instance_type = "t3.small"

  tags = {
    Name = "frontend"
  }
}


resource "aws_instance" "mongo" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-03ec8b1ac2604e9da"]
  instance_type = "t3.small"

  tags = {
    Name = "mongo"
  }
}


resource "aws_instance" "catalogue" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-03ec8b1ac2604e9da"]
  instance_type = "t3.small"

  tags = {
    Name = "catalogue"
  }
}