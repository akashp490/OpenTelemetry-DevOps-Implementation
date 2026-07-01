# 🚀 Ultimate DevOps Implementation: Microservices on AWS EKS

![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)

A complete end-to-end DevOps lifecycle implementation for a distributed microservices architecture (based on the OpenTelemetry Demo). This project demonstrates Infrastructure as Code (IaC), containerization strategies, and local-to-cloud deployment on AWS.

## 🏗️ Architecture

### OpenTelemetry Original Architecture Diagram

```mermaid
graph TD
subgraph Service Diagram
accounting(Accounting):::dotnet
ad(Ad):::java
cache[(Cache<br/>&#40Valkey&#41)]
cart(Cart):::dotnet
checkout(Checkout):::golang
currency(Currency):::cpp
email(Email):::ruby
flagd(Flagd):::golang
flagd-ui(Flagd-ui):::elixir
fraud-detection(Fraud Detection):::kotlin
frontend(Frontend):::typescript
frontend-proxy(Frontend Proxy <br/>&#40Envoy&#41):::cpp
image-provider(Image Provider <br/>&#40nginx&#41):::cpp
llm(LLM):::python
load-generator([Load Generator]):::python
payment(Payment):::javascript
product-catalog(Product Catalog):::golang
product-reviews(Product Reviews):::python
quote(Quote):::php
recommendation(Recommendation):::python
shipping(Shipping):::rust
queue[(queue<br/>&#40Kafka&#41)]:::java
react-native-app(React Native App):::typescript
postgresql[(Database<br/>&#40PostgreSQL&#41)]

accounting ---> postgresql

ad ---->|gRPC| flagd

checkout -->|gRPC| currency
checkout -->|gRPC| cart
checkout -->|TCP| queue

cart --> cache
cart -->|gRPC| flagd

checkout -->|gRPC| payment
checkout --->|HTTP| email
checkout -->|gRPC| product-catalog
checkout -->|HTTP| shipping

fraud-detection -->|gRPC| flagd

frontend -->|gRPC| ad
frontend -->|gRPC| currency
frontend -->|gRPC| cart
frontend -->|gRPC| checkout
frontend -->|HTTP| shipping
frontend ---->|gRPC| recommendation
frontend -->|gRPC| product-catalog
frontend -->|gRPC| product-reviews

frontend-proxy -->|gRPC| flagd
frontend-proxy -->|HTTP| frontend
frontend-proxy -->|HTTP| flagd-ui
frontend-proxy -->|HTTP| image-provider

llm -->|gRPC| flagd
llm ---> product-reviews

payment -->|gRPC| flagd

product-reviews -->|gRPC| flagd
product-reviews -->|gRPC| product-catalog
product-reviews -->|gRPC| llm
product-reviews ---> postgresql

queue -->|TCP| accounting
queue -->|TCP| fraud-detection

recommendation -->|gRPC| flagd
recommendation -->|gRPC| product-catalog

shipping -->|HTTP| quote

Internet -->|HTTP| frontend-proxy
load-generator -->|HTTP| frontend-proxy
react-native-app -->|HTTP| frontend-proxy
end

classDef dotnet fill:#178600,color:white;
classDef cpp fill:#f34b7d,color:white;
classDef elixir fill:#b294bb,color:black;
classDef golang fill:#00add8,color:black;
classDef java fill:#b07219,color:white;
classDef javascript fill:#f1e05a,color:black;
classDef kotlin fill:#560ba1,color:white;
classDef php fill:#4f5d95,color:white;
classDef python fill:#3572A5,color:white;
classDef ruby fill:#701516,color:white;
classDef rust fill:#dea584,color:black;
classDef typescript fill:#e98516,color:black;
```

```mermaid
graph LR
subgraph Service Legend
  dotnetsvc(.NET):::dotnet
  cppsvc(C++):::cpp
  elixirsvc(Elixir):::elixir
  golangsvc(Go):::golang
  javasvc(Java):::java
  javascriptsvc(JavaScript):::javascript
  kotlinsvc(Kotlin):::kotlin
  phpsvc(PHP):::php
  pythonsvc(Python):::python
  rubysvc(Ruby):::ruby
  rustsvc(Rust):::rust
  typescriptsvc(TypeScript):::typescript
end

classDef dotnet fill:#178600,color:white;
classDef cpp fill:#f34b7d,color:white;
classDef elixir fill:#b294bb,color:black;
classDef golang fill:#00add8,color:black;
classDef java fill:#b07219,color:white;
classDef javascript fill:#f1e05a,color:black;
classDef kotlin fill:#560ba1,color:white;
classDef php fill:#4f5d95,color:white;
classDef python fill:#3572A5,color:white;
classDef ruby fill:#701516,color:white;
classDef rust fill:#dea584,color:black;
classDef typescript fill:#e98516,color:black;
```

## 🎯 Project Objectives & Achievements

**Infrastructure Automation**
Provisioned a production-grade AWS environment using Terraform, including a custom VPC (public/private subnets), NAT Gateway, Internet Gateway, and an EKS cluster with managed node groups.

**Containerization & Optimization**
Designed multi-stage Dockerfiles for Go-based microservices (*product-catalog*, *ad*, *recommendation*), significantly reducing image size and improving build efficiency.

**Local Validation Pipeline**
Implemented Docker Compose to simulate a microservices environment locally, ensuring seamless inter-service communication before deploying to the cloud.

---

## 🛠️ Tech Stack

* **Cloud Provider:** AWS (EC2, EKS, VPC, IAM)
* **Containerization:** Docker, Docker Compose, DockerHub
* **Infrastructure as Code:** Terraform
* **Microservices:** OpenTelemetry Demo Applications (Go, Python, Java)

---

## 📋 Prerequisites

Ensure the following tools are installed and configured:

* **AWS CLI** – Configured with IAM credentials (`aws configure`)
* **Terraform (v1.0+)** – For infrastructure provisioning
* **kubectl** – For Kubernetes cluster interaction
* **Docker & Docker Compose** – For local builds and testing

---

## 🚀 Implementation Workflow

### Phase 1: Local Setup & Infrastructure Provisioning

* Provisioned a **t2.large EC2 instance** as a bastion host with custom security groups
* Dynamically expanded EBS volume to handle container workloads:

  ```bash
  sudo growpart /dev/xvda 1
  sudo resize2fs /dev/xvda1
  ```
* Installed Docker, kubectl, and Terraform
* Validated microservices locally using:

  ```bash
  docker-compose up -d
  ```
* Provisioned AWS infrastructure (VPC, EKS, node groups) using modular Terraform code

---

### Phase 2: Kubernetes Deployment

* Built and pushed optimized Docker images to a remote registry
* Deployed microservices onto AWS EKS
* Implemented namespace-based isolation (e.g., `app-production`, `monitoring`)
* Configured Kubernetes services:

  * **ClusterIP** for internal communication
  * **LoadBalancer** for external access

---

## 💻 How to Run the Project

### 1. Clone & Run Locally

```bash
git clone https://github.com/akashp490/OpenTelemetry-DevOps-Implementation.git
cd OpenTelemetry-DevOps-Implementation
docker-compose up -d
```

### 2. Provision Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply --auto-approve
```

### 3. Deploy to EKS

```bash
aws eks update-kubeconfig --region <your-region> --name <your-cluster-name>
cd ../kubernetes
kubectl apply -f .
```

---

## 🛑 Cleanup & Cost Management

To avoid unnecessary AWS charges (~$3–$5/day for EKS, NAT Gateway, and Load Balancers), destroy infrastructure after use:

```bash
cd terraform
terraform destroy --auto-approve
```

---

## 🧠 Challenges & Key Learnings

* **Volume Mount Issues**
  Resolved data-sharing failures by correctly configuring Kubernetes `EmptyDir` volumes between pods

* **Service Exposure**
  Transitioned from internal-only (`ClusterIP`) services to externally accessible endpoints using AWS LoadBalancer and NodePort

* **Docker Optimization**
  Reduced image sizes by ~60% using multi-stage builds with lightweight runtime images (Alpine/Distroless)

* **Terraform State Management**
  Addressed state locking issues and improved reliability by migrating state from local storage to a remote backend
