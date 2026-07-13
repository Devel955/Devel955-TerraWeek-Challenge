locals {
  name_prefix = lower(join("-", [var.environment, var.container_name]))

  base_labels = {
    project     = "terraweek"
    day         = "02"
    environment = var.environment
  }

  merged_labels = merge(
    local.base_labels,
    var.labels,
    {
      display_name = upper(var.container_name)
      name_count   = tostring(length(var.names))
    }
  )

  upper_names = [for name in var.names : upper(name)]

  message = format(
    "%s is running in the %s environment",
    local.name_prefix,
    var.environment
  )

  instance_size_example = var.environment == "prod" ? "t3.medium" : "t3.micro"
  container_status      = var.enable_container ? "enabled" : "disabled"
}
