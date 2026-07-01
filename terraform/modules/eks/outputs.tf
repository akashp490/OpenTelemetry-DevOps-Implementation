#############################################
# EKS Outputs
#############################################

output "cluster_name" {
  description = "Name of the Amazon EKS Cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "API endpoint of the Amazon EKS Cluster"
  value       = aws_eks_cluster.main.endpoint
}