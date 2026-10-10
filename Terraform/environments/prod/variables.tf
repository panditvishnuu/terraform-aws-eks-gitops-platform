variable "project_name" {
  type    = string
  default = "cloudforge"
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.30.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = [
    "10.30.1.0/24",
    "10.30.2.0/24"
  ]
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = [
    "10.30.11.0/24",
    "10.30.12.0/24"
  ]
}

variable "availability_zones" {
  type = list(string)
  default = [
    "us-west-2a",
    "us-west-2b"
  ]
}

variable "private_availability_zones" {
  type = list(string)
  default = [
    "us-west-2a",
    "us-west-2b"
  ]
}

variable "tags" {
  type = map(string)
  default = {
    Owner = "platform-team"
  }
}
