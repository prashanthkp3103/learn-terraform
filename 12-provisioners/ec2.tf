resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.ami.image_id
  vpc_security_group_ids = data.aws_security_groups.sg.ids
  instance_type = each.value["instance_type"] # as instance type is a map inside component variable

  tags = {
    Name = "${each.key}dev"
  }
  provisioner "remote-exec" {
    connection {
      user  = "ec2-user"
      password = "DevOps321"
      host  = self.private_ip
    }
    #from here execution happens with inline
    inline = [
      "sudo pip-3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/prashanthkp3103/roboshop-ansible/main.yml -e env=dev -e role_name=${each.key}"

    ]
  }
}


resource "aws_route53_record" "frontend" {
  for_each = var.components
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "${each.key}dev.${var.domain_name}"
  type    = "A"
  ttl     = 15
  records = [aws_instance.instance[each.key].private_ip]
}


# resource "aws_instance" "mongo" {
#   count = length(var.components)
#   ami           = data.aws_ami.ami.image_id
#   vpc_security_group_ids = data.aws_security_groups.sg.ids
#   instance_type = var.instance_type
#
#   tags = {
#     Name = "mongo.dev"
#   }
# }
#
# resource "aws_route53_record" "mongo" {
#   zone_id = data.aws_route53_zone.zone.zone_id
#   name    = "mongo.dev.${var.domain_name}"
#   type    = "A"
#   ttl     = 15
#   records = [aws_instance.mongo.private_ip]
# }
#
#
# resource "aws_instance" "catalogue" {
#   ami           = data.aws_ami.ami.image_id
#   vpc_security_group_ids = data.aws_security_groups.sg.ids
#   instance_type = var.instance_type
#
#   tags = {
#     Name = "catalogue.dev"
#   }
# }
#
# resource "aws_route53_record" "catalogue" {
#   zone_id = data.aws_route53_zone.zone.zone_id
#   name    = "catalogue.dev.${var.domain_name}"
#   type    = "A"
#   ttl     = 15
#   records = [aws_instance.catalogue.private_ip]
# }