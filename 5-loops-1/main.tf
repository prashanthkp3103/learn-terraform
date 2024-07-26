resource "null_resource" "test" {}

#it will run for 3 times
resource "null_resource" "ppk" {
  count = 3
}

#Based on input i wanna perform loop
#List variable
variable "components" {
  default = ["frontend","mongo","catalogue"]
}

resource "null_resource" "ppk" {
  count = length(var.components)
}
