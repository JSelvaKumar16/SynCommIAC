output "vpc_id" {
  value       = aws_vpc.main.id
  description = "ID of the VPC"
}

output "public_subnets" {
  value       = aws_subnet.public[*].id
  description = "List of public subnet IDs"
}

output "private_subnets" {
  value       = aws_subnet.private[*].id
  description = "List of private subnet IDs"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "ID of the internet gateway"
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.nat[0].id
  description = "ID of the NAT gateway"
}
