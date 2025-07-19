provider "aws" {
  profile = "serverless-playground"
  region  = var.region_map[terraform.workspace]
}
