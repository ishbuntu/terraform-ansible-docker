terraform {
  backend "s3" {
    bucket               = "terraform-state-e9ee7"
    key                  = "terraform.tfstate"
    region               = "eu-west-1"
    dynamodb_table       = "terraform-locks-e9ee7"
    encrypt              = true
    workspace_key_prefix = "env"
  }
}
