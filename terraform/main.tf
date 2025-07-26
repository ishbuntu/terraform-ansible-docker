# App Module
module "ec2-web_app" {
  source             = "./modules/compute/web-app-al2"
  security_group_ids = [module.standard_networking.ssh_security_group_id]
}

# GitLab Module 
module "ec2-gitlab" {
  source                = "./modules/compute/gitlab-al2"
  vpc_security_group_ids = [module.standard_networking.ssh_security_group_id]
}

#GitLab Runner Module 
module "ec2-gitlab-runner" {
  source                = "./modules/compute/gitlab-runner"
  vpc_security_group_ids = [module.standard_networking.ssh_security_group_id]
}

#Standardised Networking Module 
module "standard_networking" {
  source = "./modules/networking"
}

# Output Web App 
output "web_app_public_ip" {
  value       = module.ec2-web_app.web_app-public_ip
  description = "Public IP of the Web App instance"
}
# Ouput GitLab 
output "gitlab_public_ip" {
  value       = module.ec2-gitlab.gitlab-public_ip
  description = "Public IP of the GitLab instance"
}
# Output Runner 
output "gitlab_runner_public_ip" {
  value       = module.ec2-gitlab-runner.runners-public_ip
  description = "Public IP of the GitLab Runner instance"
}

