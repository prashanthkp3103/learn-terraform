resource "aws_instance" "frontend" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-03ec8b1ac2604e9da"]
  instance_type = "t3.small"

  tags = {
    Name = "frontend.dev"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = Z0668859214N41P8Y7GLH
  name    = "meppk.xyz"
  type    = "A"
  ttl     = 15
  records = [aws_instance.frontend.private_ip]
}


resource "aws_instance" "mongo" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-03ec8b1ac2604e9da"]
  instance_type = "t3.small"

  tags = {
    Name = "mongo.dev"
  }
}

resource "aws_route53_record" "mongo" {
  zone_id = Z0668859214N41P8Y7GLH
  name    = "meppk.xyz"
  type    = "A"
  ttl     = 15
  records = [aws_instance.mongo.private_ip]
}


resource "aws_instance" "catalogue" {
  ami           = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-03ec8b1ac2604e9da"]
  instance_type = "t3.small"

  tags = {
    Name = "catalogue.dev"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = Z0668859214N41P8Y7GLH
  name    = "meppk.xyz"
  type    = "A"
  ttl     = 15
  records = [aws_instance.catalogue.private_ip]
}