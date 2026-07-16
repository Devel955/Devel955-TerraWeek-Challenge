terraform {
  required_version = ">= 1.15.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.13"
    }
  }
}

resource "local_file" "state_demo" {
  filename = "${path.module}/state-demo.txt"
  content  = "TerraWeek Day 4: local state created before S3 backend migration."
}

resource "time_sleep" "lock_demo" {
  create_duration = "120s"

  triggers = {
    lock_proof = "change-this-value-to-reproduce-lock"
  }
}

output "demo_file_path" {
  value = local_file.state_demo.filename
}

output "lock_demo_duration" {
  value = time_sleep.lock_demo.create_duration
}
