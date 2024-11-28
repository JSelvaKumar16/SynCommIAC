resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-vpc" })
}

resource "aws_subnet" "public" {
  count                   = var.public_subnet_count
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.default_tags, { 
    Name = "${var.project_name}-${var.environment}-public-${count.index + 1}" 
  })
}

resource "aws_subnet" "private" {
  count      = var.private_subnet_count
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]

  tags = merge(var.default_tags, { 
    Name = "${var.project_name}-${var.environment}-private-${count.index + 1}" 
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-igw" })
}

resource "aws_eip" "nat" {
  count = var.public_subnet_count > 0 ? 1 : 0

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-eip-${count.index}" })
}

resource "aws_nat_gateway" "nat" {
  count         = var.public_subnet_count > 0 ? 1 : 0
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-nat" })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-public-rt" })
}

resource "aws_route_table_association" "public" {
  count          = var.public_subnet_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  count  = var.public_subnet_count > 0 ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[0].id
  }

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-private-rt" })
}

resource "aws_route_table_association" "private" {
  count          = var.private_subnet_count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}
