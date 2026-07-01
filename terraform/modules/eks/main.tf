#############################################
# VPC Outputs
#############################################

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

#############################################
# Public Subnets
#############################################

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

#############################################
# Private Subnets
#############################################

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}