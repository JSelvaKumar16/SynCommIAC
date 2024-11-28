output "bucket_name" {
  value       = aws_s3_bucket.main.bucket
  description = "Name of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.main.arn
  description = "ARN of the S3 bucket"
}

output "bucket_policy" {
  value       = aws_s3_bucket_policy.policy
  description = "Policy attached to the S3 bucket"
}

output "versioning_status" {
  value       = aws_s3_bucket_versioning.versioning.versioning_configuration[0].status
  description = "Versioning status of the S3 bucket"
}

output "encryption_algorithm" {
  value       = aws_s3_bucket_server_side_encryption_configuration.encryption.rule[0].apply_server_side_encryption_by_default[0].sse_algorithm
  description = "Server-side encryption algorithm used for the S3 bucket"
}
