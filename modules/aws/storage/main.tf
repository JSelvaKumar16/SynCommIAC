resource "aws_s3_bucket" "main" {
  bucket = "${var.project_name}-${var.environment}-bucket"

  force_destroy = var.force_destroy

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-bucket" })
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.encryption_algorithm
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.main.id

  rule {
    id     = "lifecycle-rule"
    status = var.enable_lifecycle_rules ? "Enabled" : "Disabled"

    transition {
      days          = var.lifecycle_transition_days
      storage_class = var.lifecycle_storage_class
    }

    expiration {
      days = var.lifecycle_expiration_days
    }

    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version_expiration_days
    }
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.main.id
  acl    = var.acl
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.main.id
  policy = var.policy_json
}
