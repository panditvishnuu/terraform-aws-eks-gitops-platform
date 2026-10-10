variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy the network in"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "Availability zones for the public subnets"
  type        = list(string)
}

variable "private_availability_zones" {
  description = "Availability zones for the private subnets"
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Whether to create a NAT gateway for private-subnet outbound internet access"
  type        = bool
  default     = false
}

variable "eks_enabled" {
  description = "Whether to add Kubernetes subnet discovery tags"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to apply to AWS resources"
  type        = map(string)
  default     = {}
}
