output "vpc_id" {
  description = "ID of the VPC created by Terraform."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID of the web security group."
  value       = aws_security_group.web.id
}

output "latest_amazon_linux_ami" {
  description = "Latest Amazon Linux 2023 AMI selected by the data source."
  value       = data.aws_ami.amazon_linux_2023.id
}

output "web_instance_ids" {
  description = "IDs of EC2 instances created with count."
  value       = aws_instance.web[*].id
}

output "web_instance_public_ips" {
  description = "Public IP addresses of the web instances."
  value       = aws_instance.web[*].public_ip
}

output "web_urls" {
  description = "Nginx URLs running on EC2."
  value       = [for instance in aws_instance.web : "http://${instance.public_ip}"]
}
