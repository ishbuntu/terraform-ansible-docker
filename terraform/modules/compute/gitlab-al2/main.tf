resource "aws_key_pair" "my_key" {
  key_name   = "${terraform.workspace}-${var.module_name}-key"
  public_key = file("${var.keys_base_path}/${var.key_dir}/${terraform.workspace}/${var.key_dir}.pub")
}

resource "aws_instance" "gitlab" {
  ami                    = var.ami_id[terraform.workspace]
  instance_type          = var.instance_type[terraform.workspace]
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = var.vpc_security_group_ids

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_tyoe
    delete_on_termination = true
  }
  tags = {
    Name = "${var.module_name}-${terraform.workspace}"
  }
}

