resource "docker_image" "nginx" {
  name         = var.container_settings.image
  keep_locally = false
}

resource "docker_container" "web" {
  name    = local.name_prefix
  image   = docker_image.nginx.image_id
  restart = var.container_settings.restart_policy

  ports {
    internal = var.container_settings.internal_port
    external = var.external_port
  }

  dynamic "labels" {
    for_each = local.merged_labels

    content {
      label = labels.key
      value = labels.value
    }
  }
}
