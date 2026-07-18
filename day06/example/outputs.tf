output "workspace_name" {
  description = "Currently selected Terraform workspace."
  value       = terraform.workspace
}

output "instance_size" {
  description = "Workspace-based instance size example."
  value       = local.instance_size
}

output "workspace_file" {
  description = "Local file created for the active workspace."
  value       = local_file.workspace_info.filename
}
