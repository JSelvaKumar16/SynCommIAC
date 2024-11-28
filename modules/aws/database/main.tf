resource "aws_db_instance" "main" {
  count                = var.create_db ? 1 : 0
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name # Use this instead of `name`
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group
  publicly_accessible  = var.publicly_accessible
  skip_final_snapshot  = var.skip_final_snapshot

  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name

  tags = merge(var.default_tags, {
    Name       = "${var.project_name}-${var.environment}-db"
    Environment = var.environment
    Project     = var.project_name
  })
}

resource "aws_db_subnet_group" "main" {
  count       = var.create_db ? 1 : 0
  name        = "${var.project_name}-${var.environment}-db-subnet-group"
  description = "Subnet group for RDS database"
  subnet_ids  = var.subnet_ids

  tags = merge(var.default_tags, {
    Name       = "${var.project_name}-${var.environment}-db-subnet-group"
    Environment = var.environment
    Project     = var.project_name
  })
}
