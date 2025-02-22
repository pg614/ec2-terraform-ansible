provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "paul-ec2-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


# Security Group for SSH & HTTP Access
resource "aws_security_group" "ec2_sg" {
  name        = "terraform-ansible-ec2-security-group"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-05b10e08d247fb927" # Amazon Linux 2023 AMI (Update if needed)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "Terraform-Ansible-EC2"
  }
}
