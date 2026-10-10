project_name             = "cloudforge"
environment              = "stage"
aws_region               = "us-east-1"
vpc_cidr_block           = "10.20.0.0/16"
public_subnet_cidrs      = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnet_cidrs     = ["10.20.11.0/24", "10.20.12.0/24"]
availability_zones       = ["us-east-1a", "us-east-1b"]
private_availability_zones = ["us-east-1a", "us-east-1b"]
tags = {
  Owner = "platform-team"
}
