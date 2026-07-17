data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

locals {
  subnet_id          = sort(data.aws_subnets.default.ids)[0]
  security_group_ids = [data.aws_security_group.default.id]

  common_tags = {
    Project     = "terraweek-day5"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Day         = "05"
  }
}

module "web_server" {
  source = "./modules/ec2_instance"

  name                   = "web"
  instance_type          = var.instance_type
  environment            = var.environment
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids
  tags                   = local.common_tags
}

module "servers" {
  source   = "./modules/ec2_instance"
  for_each = var.create_multiple_servers ? var.server_names : toset([])

  name                   = each.key
  instance_type          = var.instance_type
  environment            = var.environment
  ami                    = data.aws_ami.al2023.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = local.security_group_ids
  tags                   = local.common_tags
}