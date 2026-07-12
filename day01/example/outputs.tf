output "generated_file" {
  description = "Path of the greeting file created by Terraform."
  value       = local_file.greeting.filename
}

output "random_name" {
  description = "The random name used in the greeting."
  value       = random_pet.name.id
}
