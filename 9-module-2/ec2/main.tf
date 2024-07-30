resource "aws_instance" "frontend" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-03ec8b1ac2604e9da"]
  instance_type = "t3.small"

  tags = {
    Name = "terraform-tes"
  }
}