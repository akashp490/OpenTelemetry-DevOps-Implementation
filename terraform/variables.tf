#############################################
# VPC Configuration
#############################################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones for the VPC"
  type        = list(string)

  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)

  default = [
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

#############################################
# EKS Configuration
#############################################

variable "cluster_name" {
  description = "Amazon EKS Cluster Name"
  type        = string
  default     = "demo-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.30"
}

#############################################
# Managed Node Group
#############################################

variable "node_groups" {
  description = "Managed node group configuration"

  type = map(object({
    instance_types = list(string)
    capacity_type  = string

    scaling_config = object({
      desired_size = number
      min_size     = number
      max_size     = number
    })
  }))

  default = {
    default = {
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"

      scaling_config = {
        desired_size = 2
        min_size     = 1
        max_size     = 3
      }
    }
  }
}