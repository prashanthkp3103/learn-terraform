#variable number

variable "abc" {
  default = 10

}

#boolean
variable "y" {
  default = true
}

#string
variable "z" {
  default = "Terraform"
}

#FYI - Quotes are not needed for number, boolean

#variable access

#outputs ( variable reference into outputs)
#direct values doesnt require to be with ${}

output "x" {
  value = var.abc
}

#variable accessing with ${} - as variable has string
output "x1" {
  value = "value of x - ${var.y}"
}

#List variable #with different datatype
variable "1" {
  default = [10,20, "abc", false]
}

#accessing list variable with index
output "1" {
  value = var.1[0]
}

#Map variable [key,value]
variable "n" {
  default = {
    course = "Devops"
    trainer = "Prashanth"
  }
}

#Accessing Map variable #string map variable accessing with $ and its value with Double quotes
output "n" {
  value = "course name - ${var.n["course"]}, Trainer name - ${var.n["trainer"]}"
}