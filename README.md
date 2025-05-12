# Terraform AWS EC2 Nginx Demo

This repository contains Terraform configurations to launch an Amazon EC2 instance with Nginx installed and configured. The EC2 instance is provisioned using **Amazon Linux 2** and configured to serve a simple web page using Nginx.

## Features

- **AWS EC2 Instance**: Creates a t2.micro EC2 instance on AWS with **Amazon Linux 2**.
- **Nginx Setup**: Installs and configures **Nginx** to serve a simple "Welcome to My Web Server" page.
- **Security Groups**: Configures a security group to allow **HTTP** (port 80) access from anywhere and **SSH** (port 22) access from a specific IP address.
- **Terraform**: Uses Terraform for Infrastructure as Code (IaC) to provision and manage the AWS resources.

## Prerequisites

Before you begin, ensure that you have the following tools installed and configured:

1. **AWS Account**: You need an AWS account to create resources on AWS.
2. **Terraform**: You need to have **Terraform** installed on your local machine. You can download Terraform [here](https://www.terraform.io/downloads).
3. **AWS CLI**: You should have the **AWS CLI** configured with the necessary credentials to authenticate with AWS. You can install the AWS CLI [here](https://aws.amazon.com/cli/).

## Usage

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/A-zook/terraform-nginx-ec2-demo.git
cd terraform-nginx-ec2-demo
