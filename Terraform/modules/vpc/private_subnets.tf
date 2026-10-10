resource "aws_subnet" "private" {
  for_each = length(var.private_subnet_cidrs) > 0 ? { for idx, cidr in var.private_subnet_cidrs : idx => {
    cidr = cidr
    az   = length(var.private_availability_zones) > idx ? var.private_availability_zones[idx] : var.availability_zones[idx]
  } } : {}

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = merge(
    local.common_tags,
    {
      Name = "${local.resource_name_prefix}-private-subnet-${each.key}"
    },
    var.eks_enabled ? {
      "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "shared"
      "kubernetes.io/role/internal-elb"                              = "1"
    } : {}
  )
}

resource "aws_route_table" "private" {
  count  = length(var.private_subnet_cidrs) > 0 ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = merge(local.common_tags, {
    Name = "${local.resource_name_prefix}-private-rt"
  })
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[0].id
}
