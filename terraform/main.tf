module "ec2-web_app" {
  source = "./modules/compute/web-app-al2"
}

output "instance_public_ip" {
  value = module.ec2-web_app.web_app-public_ip
}

