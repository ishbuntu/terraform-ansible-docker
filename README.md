# Multi-Environment DevOps Infrastructure with Docker, Ansible, and Terraform

This project demonstrates a comprehensive DevOps workflow for deploying multiple applications across different environments using:

- **Docker** for containerization
- **Ansible** for configuration management and automation
- **Terraform** for infrastructure provisioning on AWS
- **GitLab CI/CD** for continuous integration and deployment

## Architecture

The project supports multiple application deployments including:
- Flask-based portfolio website
- GitLab CE server for source code management
- GitLab Runner for CI/CD automation

All infrastructure is provisioned using Terraform with multi-environment support (dev/test/prod), configured using Ansible roles, and applications are containerized using Docker.

## Features

- **Multi-Environment Support**: Separate dev, test, and prod environments
- **Infrastructure as Code (IaC)**: Complete AWS infrastructure automation
- **Configuration Management**: Role-based Ansible automation
- **Containerized Applications**: Docker-based application deployment
- **CI/CD Pipeline**: GitLab-based continuous integration and deployment
- **Security**: SSH key management and secure credential handling
- **Modular Design**: Reusable Terraform modules and Ansible roles

## Project Structure

```
ans-terra/
├── ansible/                    # Ansible configuration management
│   ├── ansible.cfg            # Ansible configuration
│   ├── group_vars/            # Group-specific variables
│   │   ├── all.yml           # Global variables
│   │   ├── webserver.yml     # Web server variables
│   │   ├── gitlab.yml        # GitLab server variables
│   │   └── gitlab-runner.yml # GitLab Runner variables
│   ├── inventories/           # Environment inventories
│   │   └── inventory.ini     # Dynamic inventory file
│   ├── playbooks/             # Ansible playbooks
│   │   ├── main.yml          # Main deployment playbook
│   │   ├── gitlab.yml        # GitLab deployment playbook
│   │   └── gitlab-runner.yml # Runner deployment playbook
│   └── roles/                 # Ansible roles
│       ├── common/           # Common system configuration
│       ├── docker/           # Docker installation and setup
│       ├── webserver/        # Web application deployment
│       ├── gitlab/           # GitLab CE installation
│       └── gitlab-runner/    # GitLab Runner configuration
├── docker-app/                # Flask web application
│   ├── app.py               # Flask application code
│   ├── Dockerfile           # Container definition
│   ├── requirements.txt     # Python dependencies
│   ├── static/              # Static web assets
│   │   ├── css/            # Stylesheets
│   │   └── js/             # JavaScript files
│   └── templates/           # HTML templates
├── terraform/                 # Infrastructure as Code
│   ├── main.tf              # Main infrastructure definition
│   ├── providers.tf         # Provider configurations
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Output values
│   ├── backend.tf           # Remote state configuration
│   ├── modules/             # Reusable Terraform modules
│   │   ├── networking/      # VPC and networking resources
│   │   └── compute/         # EC2 compute resources
│   │       ├── web-app-al2/ # Web application module
│   │       ├── gitlab-al2/  # GitLab server module
│   │       └── gitlab-runner/ # GitLab Runner module
│   ├── terraform.tfstate.d/ # Workspace state directories
│   │   ├── dev/            # Development environment state
│   │   ├── test/           # Test environment state
│   │   └── prod/           # Production environment state
│   └── tf-scripts/          # Terraform helper scripts
├── scripts/                   # Automation scripts
│   ├── remote-backend-auto.sh # S3 backend setup automation
│   ├── generate-keys.sh      # SSH key generation
│   ├── add-keys-agent.sh     # SSH agent key management
│   └── get-ip-output.sh      # Instance IP retrieval
├── keys/                      # SSH keys (per environment)
│   ├── webapp/              # Web application keys
│   ├── gitlab/              # GitLab server keys
│   └── runner/              # GitLab Runner keys
├── gitlab-creds/              # GitLab credentials
└── docker-compose_gitlab.yml  # GitLab Docker Compose configuration
```

> Note: Sensitive files like SSH keys, credentials, and inventory files are excluded from version control via `.gitignore`.

## Deployment Process

### 1. Infrastructure Provisioning with Terraform

Terraform provisions AWS infrastructure including:
- EC2 instances for different application types
- Security groups with appropriate access rules
- VPC and networking configuration
- Multi-environment workspace management

### 2. SSH Key Management

Automated SSH key generation and management:
- Environment-specific key pairs (dev/test/prod)
- Separate keys for different application types
- Secure key distribution and agent management

### 3. Configuration Management with Ansible

Ansible roles automate server configuration:
- **Common role**: System updates, basic security, user management
- **Docker role**: Docker installation and service configuration
- **Webserver role**: Flask application deployment and container management
- **GitLab role**: GitLab CE installation and configuration
- **GitLab Runner role**: CI/CD runner setup and registration

### 4. Application Deployment

Applications are deployed using:
- Docker containers for consistent runtime environments
- Environment-specific configurations
- Automated service startup and health checks
- Port mapping and network configuration

## Skills Demonstrated

- **Infrastructure as Code**: Complete AWS infrastructure automation with Terraform
- **Configuration Management**: Advanced Ansible playbooks and role-based automation
- **Containerization**: Docker-based application deployment and management
- **CI/CD**: GitLab-based continuous integration and deployment pipelines
- **Multi-Environment Management**: Separate dev/test/prod environment handling
- **Security**: SSH key management, credential handling, and secure configurations
- **Scripting**: Bash automation scripts for common tasks
- **Cloud Architecture**: AWS VPC, EC2, and security group design
- **Version Control**: Git-based infrastructure and application code management
- **Modular Design**: Reusable Terraform modules and Ansible roles

## Environment Management

The project supports three environments:
- **Development (dev)**: For active development and testing
- **Test (test)**: For integration testing and validation
- **Production (prod)**: For live application deployment

Each environment maintains:
- Separate Terraform workspaces
- Environment-specific SSH keys
- Isolated infrastructure resources
- Dedicated configuration variables

## Future Enhancements

- Implement monitoring with Prometheus and Grafana
- Add automated testing in CI/CD pipeline
- Implement container orchestration with Kubernetes
- Add database integration with RDS
- Implement blue-green deployment strategies
- Add automated backup and disaster recovery
- Integrate with AWS CloudWatch for logging and monitoring

