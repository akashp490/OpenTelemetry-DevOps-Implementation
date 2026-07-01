#############################################
# VPC Configuration
#############################################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

#############################################
# Availability Zones
#############################################

variable "availability_zones" {
  description = "Availability Zones for the VPC"
  type        = list(string)
}

#############################################
# Public Subnets
#############################################

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

#############################################
# Private Subnets
#############################################

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}