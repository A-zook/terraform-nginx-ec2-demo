provider "aws" {
  region = "us-east-1"
}

# Data source to fetch the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Security group to allow HTTP and SSH access
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = "vpc-123456789" # Replace with your VPC ID

 ingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/32"] # Restrict to your IP in production
  }

  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
}

# EC2 instance
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = "subnet-0123456789" # Replace with your subnet ID
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name      = "May-Key-Pair" # Replace with your key pair name

  # User data script to run on instance launch
  user_data = file("config_script.sh")

  tags = {
    Name = "WebServerInstance"
  }
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}
