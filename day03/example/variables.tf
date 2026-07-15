variable "aws_region" {
  description = "AWS region for Day 3 resources."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used in resource tags."
  type        = string
  default     = "terraweek-day3"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "staging"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "instance_count" {
  description = "Number of identical EC2 instances to create."
  type        = number
  default     = 1

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 2
    error_message = "instance_count must be between 1 and 2."
  }
}
