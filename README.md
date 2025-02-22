# 🚀 AWS EC2 Deployment with Terraform & Ansible

This project automates the deployment of an **AWS EC2 instance** using **Terraform** and configures it using **Ansible**.

## 📌 Project Overview

✅ **Terraform:**  
- Deploys an EC2 instance  
- Configures security groups for SSH & HTTP access  
- Sets up an AWS key pair for authentication  

✅ **Ansible:**  
- Installs **Nginx** on the EC2 instance  
- Deploys a custom webpage  
- Ensures Nginx restarts on reboot  

## 🛠️ Setup & Deployment

### 1️⃣ **Clone This Repo**
```bash
git clone https://github.com/pg614/aws-ec2-terraform-ansible.git
cd aws-ec2-terraform-ansible
