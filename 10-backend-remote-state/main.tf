resource "null_resource" "test" {}

terraform {
  backend "s3" {
    bucket = "d80-terraform-ppk"
    key    = "test/terraform.tfstate"
    region = "us-east-1"
  }
}
