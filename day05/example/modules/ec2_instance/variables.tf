variable "name" {
  description = "Name used for the EC2 instance."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.name))
    error_message = "name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "ami" {
  description = "AMI ID resolved by the root module."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID resolved by the root module."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security group IDs resolved by the root module."
  type        = list(string)
}

variable "tags" {
  description = "Common tags passed from the root module."
  type        = map(string)
  default     = {}
}
