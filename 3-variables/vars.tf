variable "abc" {
  default = 10

}

#outputs
output "x" {
  value = var.abc
}