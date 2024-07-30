resource "aws_route53_record" "frontend" {
  zone_id = "Z0668859214N41P8Y7GLH"
  name    = "test.dev.meppk.xyz"
  type    = "A"
  ttl     = 15
  records = [var.private_ip]
}

variable "private_ip" {}