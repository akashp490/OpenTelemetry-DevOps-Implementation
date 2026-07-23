# 🚀 End-to-End DevOps CI/CD Pipeline on AWS EKS

![AWS](https://img.shields.io/badge/AWS-EKS%20%7C%20VPC%20%7C%20IAM-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![ArgoCD](https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D?style=for-the-badge&logo=argo&logoColor=white)

---

## 📌 Project Overview

This project demonstrates a complete **production-style DevOps workflow** by deploying containerized microservices onto **Amazon EKS** using **Terraform**, **Docker**, **GitHub Actions**, and **Argo CD**.

The infrastructure is provisioned using Infrastructure as Code (Terraform), application images are automatically built and pushed to Docker Hub using GitHub Actions, and deployments are managed using GitOps principles with Argo CD.

The project uses three microservices from the OpenTelemetry Demo application:

- Ad Service (Java)
- Product Catalog (Go)
- Recommendation Service (Python)

---

# 🏗 Architecture

```text
                    Developer
                         │
                    Git Push
                         │
                         ▼
                GitHub Repository
                         │
                         ▼
               GitHub Actions (CI)
          Build & Push Docker Images
                         │
                         ▼
                     Docker Hub
                         │
                         ▼
                Argo CD (GitOps CD)
                         │
                         ▼
          Amazon EKS Cluster (Terraform)
                         │
       ┌─────────────────┼─────────────────┐
       ▼                 ▼                 ▼
   Ad Service     Product Catalog    Recommendation
```

---

# ⚙️ DevOps Workflow

```
Developer Push

↓

GitHub Actions

↓

Build Docker Images

↓

Push Images to Docker Hub

↓

Argo CD Detects Git Changes

↓

Sync Kubernetes Manifests

↓

Deploy to Amazon EKS
```

---

# ✨ Features

- Infrastructure Provisioning using Terraform
- Modular Terraform Project Structure
- Remote Terraform State using Amazon S3
- State Locking using DynamoDB
- Custom AWS VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Amazon EKS Cluster
- Managed Node Group
- Dockerized Microservices
- Multi-language Microservices (Java, Go, Python)
- GitHub Actions CI Pipeline
- Docker Hub Integration
- GitOps Continuous Deployment using Argo CD
- Kubernetes Deployments
- Kubernetes Services
- Resource Requests & Limits
- Rolling Updates
- Image Version Management

---

# 🛠 Tech Stack

## Cloud

- Amazon Web Services (AWS)
  - EC2
  - VPC
  - IAM
  - EKS
  - S3
  - DynamoDB

## Infrastructure as Code

- Terraform

## Containers

- Docker
- Docker Hub

## Container Orchestration

- Kubernetes
- Amazon EKS

## CI/CD

- GitHub Actions
- Argo CD

## Version Control

- Git
- GitHub

---

# 📂 Repository Structure

```text
.
├── .github
│   └── workflows
│       └── ci.yml
│
├── kubernetes
│   ├── ad
│   ├── product-catalog
│   └── recommendation
│
├── terraform
│   ├── backend
│   └── modules
│       ├── eks
│       └── vpc
│
├── src
│
└── README.md
```

---

# 🚀 Deployment Steps

## 1. Clone Repository

```bash
git clone https://github.com/akashp490/OpenTelemetry-DevOps-Implementation.git

cd OpenTelemetry-DevOps-Implementation
```

---

## 2. Configure AWS Credentials

```bash
aws configure
```

---

## 3. Provision Infrastructure

```bash
cd terraform/backend

terraform init

terraform apply
```

Then provision the infrastructure:

```bash
cd ..

terraform init

terraform apply
```

---

## 4. Configure kubectl

```bash
aws eks update-kubeconfig \
--region ap-south-1 \
--name demo-eks-cluster
```

---

## 5. Install Argo CD

```bash
kubectl create namespace argocd

kubectl apply -n argocd \
-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

---

## 6. Deploy Application

Create an Argo CD Application pointing to the Kubernetes manifests inside this repository.

Argo CD continuously synchronizes the cluster with the Git repository.

---


# 📷 Project Screenshots

## GitHub Actions


![GitHub Actions](docs/images/github-actions-success.png)


---

## Argo CD


![ArgoCD](docs/images/argocd-dashboard.png)

---

## Kubernetes Pods


![Pods](docs/images/kubectl-pods.png)

---

## Kubernetes Nodes


![Nodes](docs/images/eks-node.png)

---

## Amazon EKS

![Eks](docs/images/eks-cluster.png)

---

## Terraform Output


![Terraform](docs/images/terraform-output.png)

---




# 📈 CI/CD Pipeline

```
Git Push
      │
      ▼
GitHub Actions
      │
      ▼
Docker Build
      │
      ▼
Docker Hub
      │
      ▼
Argo CD
      │
      ▼
Amazon EKS
```

---

# 👨‍💻 Author

**Akash Patro**

LinkedIn: https://www.linkedin.com/in/akashpatro490/


--- 


⭐ If you found this repository helpful, consider giving it a Star!