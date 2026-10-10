variable "eks_role_arn" {
  type        = string
  description = "ARN of the existing EKS cluster IAM role; attach AmazonEKSClusterPolicy"
}

variable "node_role_arn" {
  type        = string
  description = "ARN of the existing worker-node IAM role; attach AmazonEKSWorkerNodePolicy, AmazonEKS_CNI_Policy, and AmazonEC2ContainerRegistryPullOnly"
}

variable "project_name" {
  type        = string
  description = "Project name used to name and tag the cluster"
}

variable "environment" {
  type        = string
  description = "Environment name used to name and tag the cluster"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Exactly two private subnet IDs, one per Availability Zone, for the EKS control plane and managed nodes"

  validation {
    condition     = length(var.private_subnet_ids) == 2
    error_message = "This EKS cluster must use exactly two private subnets, one per Availability Zone."
  }
}

variable "private_subnet_availability_zones" {
  type        = list(string)
  description = "Availability Zones configured for the private subnets"

  validation {
    condition     = length(var.private_subnet_availability_zones) == 2 && length(distinct(var.private_subnet_availability_zones)) == 2
    error_message = "The private subnets must be configured in exactly two distinct Availability Zones."
  }
}

variable "cluster_endpoint_public_access_cidrs" {
  type        = list(string)
  description = "CIDR blocks permitted to reach the public Kubernetes API endpoint"

  validation {
    condition     = length(var.cluster_endpoint_public_access_cidrs) > 0
    error_message = "Provide at least one trusted CIDR for public Kubernetes API access."
  }
}

variable "node_instance_types" {
  type        = list(string)
  description = "EC2 instance types for the managed node group"
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  type        = number
  description = "Desired number of worker nodes"
  default     = 2
}

variable "node_min_size" {
  type        = number
  description = "Minimum number of worker nodes"
  default     = 1
}

variable "node_max_size" {
  type        = number
  description = "Maximum number of worker nodes"
  default     = 3
}

variable "tags" {
  type        = map(string)
  description = "Additional tags applied to EKS resources"
  default     = {}
}
