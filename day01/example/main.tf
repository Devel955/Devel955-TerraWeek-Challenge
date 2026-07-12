terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "random_pet" "name" {
  length = 2
}

resource "local_file" "greeting" {
  filename = "${path.module}/greeting.txt"
  content  = "Hello, ${random_pet.name.id}! Welcome to Day 1 of TerraWeek Challenge 🚀"
}