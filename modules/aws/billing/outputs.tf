output "budget_name" {
  value       = aws_budgets_budget.main.name
  description = "Name of the budget"
}

output "budget_limit" {
  value       = aws_budgets_budget.main.limit_amount
  description = "Budget limit for this environment in USD"
}

output "notification_email" {
  value       = var.notification_email
  description = "Email used for notifications"
}
