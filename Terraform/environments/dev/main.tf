terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  project_name               = var.project_name
  environment                = var.environment
  aws_region                 = var.aws_region
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidrs        = var.public_subnet_cidrs
  private_subnet_cidrs       = var.private_subnet_cidrs
  availability_zones         = var.availability_zones
  private_availability_zones = var.private_availability_zones
  enable_nat_gateway         = true
  eks_enabled                = true
  tags                       = var.tags
}

module "eks" {
  source = "../../modules/eks"

  project_name                         = var.project_name
  environment                          = var.environment
  eks_role_arn                         = var.eks_cluster_role_arn
  node_role_arn                        = var.eks_node_role_arn
  private_subnet_ids                   = module.vpc.private_subnet_ids
  private_subnet_availability_zones    = module.vpc.private_subnet_availability_zones
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  tags                                 = var.tags
}
