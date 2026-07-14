output "container_id" {
  description = "ID assigned to the Nginx container."
  value       = docker_container.web.id
}

output "container_name" {
  description = "Name calculated through locals."
  value       = docker_container.web.name
}

output "application_url" {
  description = "Local URL for the Nginx web server."
  value       = "http://localhost:${var.external_port}"
}

output "message" {
  description = "Formatted message created using locals."
  value       = local.message
}

output "upper_names" {
  description = "Names transformed with a for expression."
  value       = local.upper_names
}

output "container_labels" {
  description = "Labels composed with merge(), upper(), and length()."
  value       = local.merged_labels
}

output "owner" {
  description = "Value fetched with lookup()."
  value       = lookup(var.labels, "owner", "not-set")
}

output "instance_size_example" {
  description = "Value selected with a conditional expression."
  value       = local.instance_size_example
}

output "container_status" {
  description = "Boolean variable evaluated through a conditional expression."
  value       = local.container_status
}

output "port_pair" {
  description = "Tuple variable example: [host_port, container_port]."
  value       = var.port_pair
}
