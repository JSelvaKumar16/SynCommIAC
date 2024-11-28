variable "instance_count" {
  description = "Number of public EC2 instances to create"
  type        = number
  default     = 2
}

variable "private_instance_count" {
  description = "Number of private EC2 instances to create"
  type        = number
  default     = 0
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the instances will be created"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for security group creation"
  type        = string
}

variable "ingress_port" {
  description = "Ingress port to allow"
  type        = number
  default     = 22
}

variable "ingress_protocol" {
  description = "Ingress protocol to allow"
  type        = string
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks for ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
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
  description = "Default tags to apply to all resources"
  type        = map(string)
  default     = {}
}
