resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.ami.image_id
  vpc_security_group_ids = data.aws_security_groups.sg.ids
  #instance_type = each.value["instance_type"] # as instance type is a map inside component variable
  instance_type = "t3.small"

  tags = {
    Name = "${each.key}.dev"
  }

}


resource "aws_route53_record" "dns_record" {
  for_each = var.components
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "${each.key}.dev.${var.domain_name}"
  type    = "A"
  ttl     = 15
  records = [aws_instance.instance[each.key].private_ip]
}
#resource creation is completely isolated and provisioner is isolated ,it will execute only after above as we have depends_on

# resource "null_resource" "ansible" {
#   depends_on = [aws_route53_record.dns_record]
#   for_each = var.components
#
#   provisioner "remote-exec" {
#     connection {
#       user  = "ec2-user"
#       password = "DevOps321"
#       host  = aws_instance.instance[each.key].private_ip
#     }
#
#
#     #from here execution happens with inline
#     inline = [
#       "sudo pip-3.11 install ansible",
#       "ansible-pull -i localhost, -U https://github.com/prashanthkp3103/Latest-Ansible-Roboshop main.yml -e env=dev -e role_name=${each.key}"
#
#     ]
#   }
# }


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