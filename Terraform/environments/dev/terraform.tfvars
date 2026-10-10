project_name             = "cloudforge"
environment              = "dev"
aws_region               = "ap-south-1"
vpc_cidr_block           = "10.10.0.0/16"
public_subnet_cidrs      = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnet_cidrs     = ["10.10.11.0/24", "10.10.12.0/24"]
availability_zones       = ["ap-south-1a", "ap-south-1b"]
private_availability_zones = ["ap-south-1a", "ap-south-1b"]
tags = {
  Owner = "platform-team"
}
