variable "region_map" {
  type = map(string)
  default = {
    test = "eu-west-1"
    dev  = "eu-west-2"
    prod = "eu-west-3"
  }
}
