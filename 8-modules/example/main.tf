resource "null_resource" "test" {
  #input variable comes from root module as 3 and resource will run for 3 times
  count = var.input

}

