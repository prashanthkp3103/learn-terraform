resource "aws_instance" "web" {
  ami           = "ami-041e2ea9402c46c32"
  instance_type = "t3.small"

  tags = {
    Name = "frontend"
  }
}