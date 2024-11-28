variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "budget_limit" {
  description = "Budget limit in USD"
  type        = string
}

variable "notification_threshold" {
  description = "Threshold for notifications as a percentage"
  type        = number
}

variable "notification_email" {
  description = "Email address to send budget notifications"
  type        = string
}
