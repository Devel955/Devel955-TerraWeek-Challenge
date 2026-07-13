variable "container_name" {
  description = "Name used for the Nginx container."
  type        = string
  default     = "terraweek-web"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.container_name))
    error_message = "container_name may contain only lowercase letters, numbers, and hyphens."
  }
}

variable "external_port" {
  description = "Host port exposed by the Nginx container."
  type        = number
  default     = 8080

  validation {
    condition     = var.external_port > 0 && var.external_port <= 65535
    error_message = "external_port must be between 1 and 65535."
  }
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "enable_container" {
  description = "Boolean example used in a conditional expression."
  type        = bool
  default     = true
}

variable "names" {
  description = "List example used with a for expression."
  type        = list(string)
  default     = ["tws", "terraweek", "hcl"]
}

variable "labels" {
  description = "Extra labels added to the Docker container."
  type        = map(string)

  default = {
    owner = "Devel955"
  }
}

variable "allowed_environments" {
  description = "Set example showing unique values."
  type        = set(string)
  default     = ["dev", "staging", "prod"]
}

variable "container_settings" {
  description = "Object example for reusable container settings."

  type = object({
    image          = string
    internal_port  = number
    restart_policy = optional(string, "no")
  })

  default = {
    image         = "nginx:alpine"
    internal_port = 80
  }
}

variable "port_pair" {
  description = "Tuple example: [host_port, container_port]."
  type        = tuple([number, number])
  default     = [8080, 80]
}

variable "registry_token" {
  description = "Sensitive-variable example. Leave empty for this public Nginx demo."
  type        = string
  sensitive   = true
  default     = ""
}
