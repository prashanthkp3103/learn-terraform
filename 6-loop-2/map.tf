resource "null_resource" "test" {}

#it will run for 3 times
resource "null_resource" "ppk" {
  count = 3
}

#Based on input i wanna perform loop
#List variable
variable "components" {
  default = {
    apple = {
      name  = "apple"
      quantity = 100
    }
    banana  = {
      name  = "banana"
      quantity = 10
    }
  }
}

resource "null_resource" "ppk" {
  for_each  = var.components
}
