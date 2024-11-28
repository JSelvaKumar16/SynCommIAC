variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "force_destroy" {
  description = "Force destroy bucket on deletion"
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "encryption_algorithm" {
  description = "Encryption algorithm for S3 bucket"
  type        = string
  default     = "AES256"
}

variable "enable_lifecycle_rules" {
  description = "Enable lifecycle rules for the bucket"
  type        = bool
  default     = false
}

variable "lifecycle_transition_days" {
  description = "Number of days after which to transition objects to a different storage class"
  type        = number
  default     = 30
}

variable "lifecycle_storage_class" {
  description = "Storage class to transition objects to"
  type        = string
  default     = "GLACIER"
}

variable "lifecycle_expiration_days" {
  description = "Number of days after which objects expire"
  type        = number
  default     = 365
}

variable "noncurrent_version_expiration_days" {
  description = "Number of days after which noncurrent object versions expire"
  type        = number
  default     = 90
}

variable "acl" {
  description = "Access control list for the bucket"
  type        = string
  default     = "private"
}

variable "policy_json" {
  description = "JSON policy to apply to the bucket"
  type        = string
  default     = ""
}

variable "default_tags" {
  description = "Default tags to apply to resources"
  type        = map(string)
  default     = {}
}
