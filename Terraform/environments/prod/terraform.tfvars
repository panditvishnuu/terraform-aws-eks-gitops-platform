project_name             = "cloudforge"
environment              = "prod"
aws_region               = "us-west-2"
vpc_cidr_block           = "10.30.0.0/16"
public_subnet_cidrs      = ["10.30.1.0/24", "10.30.2.0/24"]
private_subnet_cidrs     = ["10.30.11.0/24", "10.30.12.0/24"]
availability_zones       = ["us-west-2a", "us-west-2b"]
private_availability_zones = ["us-west-2a", "us-west-2b"]
tags = {
  Owner = "platform-team"
}
