variable "project_name" {
  type    = string
  default = "cloudforge"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = [
    "10.10.1.0/24",
    "10.10.2.0/24"
  ]
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = [
    "10.10.11.0/24",
    "10.10.12.0/24"
  ]
}

variable "availability_zones" {
  type = list(string)
  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

variable "private_availability_zones" {
  type = list(string)
  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

variable "tags" {
  type = map(string)
  default = {
    Owner = "platform-team"
  }
}

variable "eks_cluster_role_arn" {
  type        = string
  description = "ARN of the existing EKS cluster IAM role with AmazonEKSClusterPolicy attached"
}

variable "eks_node_role_arn" {
  type        = string
  description = "ARN of the existing worker-node IAM role with the required EKS worker policies attached"
}

variable "cluster_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "Trusted CIDR blocks allowed to access the public Kubernetes API endpoint"

  validation {
    condition     = length(var.cluster_endpoint_public_access_cidrs) > 0
    error_message = "Provide at least one trusted CIDR for public Kubernetes API access."
  }
}
