#############################################
# VPC Outputs
#############################################

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

#############################################
# EKS Outputs
#############################################

output "cluster_name" {
  description = "Amazon EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Amazon EKS Cluster API Endpoint"
  value       = module.eks.cluster_endpoint
}