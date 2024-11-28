variable "create_db" {
  description = "Flag to create the database (true/false)"
  type        = bool
  default     = false
}

variable "allocated_storage" {
  description = "Allocated storage for the database in GB"
  type        = number
  default     = 20
}

variable "engine" {
  description = "Database engine (e.g., MySQL, PostgreSQL)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "Instance class for the database"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "username" {
  description = "Master username for the database"
  type        = string
}

variable "password" {
  description = "Master password for the database"
  type        = string
}

variable "parameter_group" {
  description = "Parameter group for the database"
  type        = string
  default     = "default.mysql8.0"
}

variable "publicly_accessible" {
  description = "Whether the database should be publicly accessible"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip the final snapshot when the database is deleted"
  type        = bool
  default     = true
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the database"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "default_tags" {
  description = "Default tags to apply to resources"
  type        = map(string)
  default     = {}
}
