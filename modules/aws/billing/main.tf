resource "aws_budgets_budget" "main" {
  name              = "${var.project_name}-${var.environment}-budget"
  budget_type       = "COST"
  limit_amount      = var.budget_limit
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "ACTUAL"
    threshold           = var.notification_threshold
    threshold_type      = "PERCENTAGE"
    subscriber_email_addresses = [var.notification_email]
  }

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-budget" })
}
