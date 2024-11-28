output "db_instance_id" {
  value       = aws_db_instance.main[0].id
  description = "ID of the RDS database instance"
}

output "db_endpoint" {
  value       = aws_db_instance.main[0].endpoint
  description = "Endpoint of the RDS database"
}

output "db_name" {
  value       = aws_db_instance.main[0].name
  description = "Name of the database"
}

output "db_subnet_group_name" {
  value       = aws_db_subnet_group.main[0].name
  description = "Name of the DB subnet group"
}
