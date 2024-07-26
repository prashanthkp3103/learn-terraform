resource "aws_route53_record" "frontend" {
  zone_id = "Z0668859214N41P8Y7GLH"
  name    = "test.dev.meppk.xyz"
  type    = "A"
  ttl     = 15
  records = [1.1.1.1]
}

variable "ttl" {}

resource "aws_route53_record" "frontend" {
  zone_id = "Z0668859214N41P8Y7GLH"
  name    = "test.dev.meppk.xyz"
  type    = "A"
  #if var.ttl is empty use default value as 15 else use var.ttl
  ttl     = var.ttl == "" ? 15 : var.ttl
  records = [1.1.1.1]
}
