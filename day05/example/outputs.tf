output "web_instance_id" {
  description = "ID returned by the web_server module."
  value       = module.web_server.instance_id
}

output "web_public_ip" {
  description = "Public IP returned by the web_server module."
  value       = module.web_server.public_ip
}

output "web_public_dns" {
  description = "Public DNS returned by the web_server module."
  value       = module.web_server.public_dns
}

output "multiple_server_ids" {
  description = "Instance IDs from for_each module instances."
  value = {
    for name, server in module.servers :
    name => server.instance_id
  }
}