output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "private_subnet_availability_zones" {
  description = "Availability Zones configured for the private subnets"
  value = [
    for idx, cidr in var.private_subnet_cidrs :
    length(var.private_availability_zones) > idx ? var.private_availability_zones[idx] : var.availability_zones[idx]
  ]
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = length(aws_route_table.private) > 0 ? aws_route_table.private[0].id : null
}

output "security_group_id" {
  description = "The ID of the public security group"
  value       = aws_security_group.public.id
}

output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.this.id
}
