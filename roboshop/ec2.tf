variable "ami" {
  default = "ami-041e2ea9402c46c32"
}

variable "instance_type" {
  default = "t3.small"
}

variable "vpc_security_group_ids" {
  default = "sg-03ec8b1ac2604e9da"
}

variable "zoneid" {
  default = "Z0668859214N41P8Y7GLH"
}

variable "domain_name" {
  default = "meppk.xyz"
}
resource "aws_instance" "frontend" {
  ami           = var.ami
  vpc_security_group_ids = [var.vpc_security_group_ids]
  instance_type = var.instance_type

  tags = {
    Name = "frontend.dev"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = var.zoneid
  name    = "frontend.dev.${var.domain_name}"
  type    = "A"
  ttl     = 15
  records = [aws_instance.frontend.private_ip]
}


resource "aws_instance" "mongo" {
  ami           = var.ami
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type = var.instance_type

  tags = {
    Name = "mongo.dev"
  }
}

resource "aws_route53_record" "mongo" {
  zone_id = var.zoneid
  name    = "mongo.dev.${var.domain_name}"
  type    = "A"
  ttl     = 15
  records = [aws_instance.mongo.private_ip]
}


resource "aws_instance" "catalogue" {
  ami           = var.ami
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type = var.instance_type

  tags = {
    Name = "catalogue.dev"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = var.zoneid
  name    = "catalogue.dev.${var.domain_name}"
  type    = "A"
  ttl     = 15
  records = [aws_instance.catalogue.private_ip]
}