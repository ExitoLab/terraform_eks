/* 
Common variables
*/

variable "project" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

/* 
VPC variables
*/

variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "vpc_cidr" {
  type        = string
  description = "AWS VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "AWS Public Subnets"
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "AWS Private Subnets"
}

/* 
EKS Variables
*/

variable "eks_cluster_version" {
  type        = string
  description = "EKS Cluster Version"
}

variable "module_eks_repo" {
  type        = string
  description = "EKS module repo"
}

variable "eks_volume_type" {
  type        = string
  description = "EKS volume type"
}
