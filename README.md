# Portfolio Website with Docker, Ansible, and Terraform

This project demonstrates a complete DevOps workflow for deploying a Flask web application using:

- **Docker** for containerization
- **Ansible** for configuration management
- **Terraform** for infrastructure provisioning on AWS

## Architecture

The application is a Flask-based portfolio website deployed on an AWS EC2 instance. The infrastructure is provisioned using Terraform, configured using Ansible, and the application is containerized using Docker.

## Features

- Containerized Flask application
- Infrastructure as Code (IaC) with Terraform
    - Use of multi-workspace for test/dev/prod
- Configuration management with Ansible

## Project Structure

```
ans-terra/
├── ansible/
│   ├── playbook.yml       # Ansible playbook for server configuration
│   └── ansible.cfg        # Ansible configuration
├── docker-app/
│   ├── app.py             # Flask application
│   ├── Dockerfile         # Container definition
│   ├── requirements.txt   # Python dependencies
│   ├── static/            # Static assets
│   │   ├── css/           # CSS stylesheets
│   │   └── js/            # JavaScript files
│   └── templates/         # HTML templates
└── terraform/
    ├── main.tf            # Infrastructure definition
    ├── modules/           # Terraform modules
    │   └── compute/       # Compute resources module
    │       └── web-app-al2/  # Amazon Linux 2 web app module
    │           ├── main.tf
    │           ├── outputs.tf
    │           └── variables.tf
    └── tf-scripts/        # Terraform helper scripts
```

> Note: Sensitive files like `inventory.ini` are excluded from this structure as they should not be committed to version control.

## Deployment Process

### 1. Infrastructure Provisioning with Terraform

Terraform is used to provision the AWS EC2 instance with the necessary security groups and networking configuration.

### 2. Server Configuration with Ansible

Ansible automates the server setup:
- Updates system packages
- Installs Docker and Git
- Configures Docker service
- Sets up user permissions
- Copies application files

### 3. Application Deployment with Docker

The Flask application is:
- Built into a Docker image
- Run as a container
- Exposed on port 80 (mapped from container port 5000)
- Configured to restart automatically

## Skills Demonstrated

- **Docker**: Containerization for consistent deployment
- **Ansible**: Configuration management and automation
- **Terraform**: Infrastructure as Code for AWS
- **Flask**: Python web application framework
- **DevOps**: End-to-end automation pipeline
- **AWS**: Cloud infrastructure management
- **Port Mapping**: Understanding of container networking

## Future Enhancements

- Add CI/CD pipeline with GitHub Actions
- Implement monitoring with Prometheus and Grafana
- Implement container orchestration with Kubernetes
- Add database integration

