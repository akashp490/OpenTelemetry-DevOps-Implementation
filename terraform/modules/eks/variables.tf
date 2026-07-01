#############################################
# EKS Cluster Configuration
#############################################

variable "cluster_name" {
  description = "Name of the Amazon EKS Cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

#############################################
# Networking
#############################################

variable "subnet_ids" {
  description = "Private subnet IDs where the worker nodes will be deployed"
  type        = list(string)
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
}