locals {
  environment   = terraform.workspace
  instance_size = terraform.workspace == "prod" ? "t3.medium" : "t3.micro"

  common_tags = {
    Project     = "terraweek-day6"
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
    Day         = "06"
  }
}

resource "local_file" "workspace_info" {
  filename = "${path.module}/workspace-info.txt"

  content = <<-EOT
    TerraWeek Day 6
    Workspace: ${local.environment}
    Instance size example: ${local.instance_size}
    Tags: ${jsonencode(local.common_tags)}
  EOT
}
