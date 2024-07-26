module "example" {
  source = "./example"
  #input is module level variable declared and referenced inside chiled module by creating variable and inside resource properties.
  input = 3
}