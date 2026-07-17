# EC2 Instance Module

Reusable Terraform child module that creates a single AWS EC2 instance. The root module supplies shared AMI, subnet, and security-group IDs, keeping this module portable.

## Inputs

- name (string): instance name
- environment (string): environment name
- ami (string): AMI ID from the root module
- instance_type (string): EC2 instance type
- subnet_id (string): target subnet ID
- vpc_security_group_ids (list(string)): security group IDs
- tags (map(string)): common resource tags

## Outputs

- instance_id
- public_ip
- public_dns
- availability_zone

## Usage

Use this module from the root configuration with source = "./modules/ec2_instance". Pass resolved AWS IDs as inputs and use the exported outputs from the root module.
