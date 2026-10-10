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
