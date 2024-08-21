variable "ami" {
  default = "ami-041e2ea9402c46c32"
}

variable "instance_type" {
  default = "t3.micro"
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


# variable "components" {
#   default = {
#     frontend = {
#       #instance_type = "t3.micro"
#     }
#     mongo = {
#       #instance_type = "t3.small"
#     }
#     catalogue = {
#       #instance_type = "t3.micro"
#     }
#     redis = {}
#     mysql = {}
#     user = {}
#     cart = {}
#     shipping = {}
#     payment = {}
#     dispatch = {}
#     rabbitmq = {}
#   }
# }

variable "components" {
  default = {
    frontend  = {}
    mongo     = {}
    catalogue = {}
    redis     = {}
    rabbitmq  = {}
    mysql     = {}
    user      = {}
    cart      = {}
    shipping  = {}
    payment   = {}
    dispatch  = {}
  }
}