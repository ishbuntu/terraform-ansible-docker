variable "ami_id" {
  type = map(string)
  default = {
    test = "ami-0b3e7dd7b2a99b08d"
    dev  = "ami-0841b1152f02fa85e"
    prod = "ami-01032886170466a16"
  }
}

variable "module_name" {
  type    = string
  default = "gitlab-runner"
}

variable "key_dir" {
  type    = string
  default = "runner"
  description = "Directory name where SSH keys are stored"
}

variable "instance_type" {
  type = map(string)
  default = {
    test = "t3.small"
    dev  = "t3.medium"
    prod = "t3.large"
  }
}

variable "keys_base_path" {
  type    = string
  default = "/local/home/ghaniis/ans-terra/keys/"
}

variable "vpc_security_group_ids" {
  type = list(string)
}

