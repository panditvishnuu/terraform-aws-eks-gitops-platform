locals {
  cluster_name = "${var.project_name}-${var.environment}"

  cluster_tags = merge(var.tags, {
    Name        = local.cluster_name
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  })
}

resource "aws_eks_cluster" "this" {
  name     = local.cluster_name
  role_arn = var.eks_role_arn

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator"]
  tags                      = local.cluster_tags

  lifecycle {
    precondition {
      condition     = length(distinct(var.private_subnet_availability_zones)) == 2
      error_message = "The two EKS private subnets must be located in two distinct Availability Zones."
    }
  }
}
