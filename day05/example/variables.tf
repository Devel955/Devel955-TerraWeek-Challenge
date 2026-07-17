variable "aws_region" {
  description = "AWS region for Day 5 resources."
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name used in tags."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "instance_type" {
  description = "EC2 instance type for web server."
  type        = string
  default     = "t3.micro"
}

variable "create_multiple_servers" {
  description = "Set true only to preview app, worker, and cache module instances."
  type        = bool
  default     = false
}

variable "server_names" {
  description = "Server names used by the for_each module call."
  type        = set(string)
  default     = ["app", "worker", "cache"]
}