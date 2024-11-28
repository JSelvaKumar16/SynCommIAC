output "iam_role_id" {
  value       = aws_iam_role.role.id
  description = "ID of the IAM role"
}

output "iam_role_name" {
  value       = aws_iam_role.role.name
  description = "Name of the IAM role"
}

output "iam_role_arn" {
  value       = aws_iam_role.role.arn
  description = "ARN of the IAM role"
}

output "iam_policy_ids" {
  value       = aws_iam_policy.policy[*].id
  description = "List of policy IDs created"
}

output "iam_policy_arns" {
  value       = aws_iam_policy.policy[*].arn
  description = "List of policy ARNs created"
}
