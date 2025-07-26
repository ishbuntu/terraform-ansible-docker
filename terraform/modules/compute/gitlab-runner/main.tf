resource "aws_key_pair" "my_key" {
  key_name   = "${terraform.workspace}-${var.module_name}-key"
  public_key = file("${var.keys_base_path}/${var.key_dir}/${terraform.workspace}/${var.key_dir}.pub")
}

resource "aws_instance" "gitlab_runner" {
  ami                    = var.ami_id[terraform.workspace]
  instance_type          = var.instance_type[terraform.workspace]
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "${var.module_name}-${terraform.workspace}"
  }
}

