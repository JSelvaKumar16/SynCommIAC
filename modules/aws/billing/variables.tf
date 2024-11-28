variable "budget_limit" {
  description = "Budget limit in USD"
  type        = string
  default     = "500"
}

variable "notification_threshold" {
  description = "Threshold for notifications as a percentage"
  type        = number
  default     = 80
}

variable "notification_email" {
  description = "Email address to send budget notifications"
  type        = string
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
