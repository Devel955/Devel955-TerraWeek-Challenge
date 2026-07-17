variable "enable_registry_vpc_example" {
  description = "Set true only to create the Registry VPC module example."
  type        = bool
  default     = false
}

module "registry_vpc_example" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  count = var.enable_registry_vpc_example ? 1 : 0

  name = "terraweek-day5-registry-vpc"
  cidr = "10.50.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.50.1.0/24", "10.50.2.0/24"]
  private_subnets = ["10.50.11.0/24", "10.50.12.0/24"]

  enable_nat_gateway = false

  tags = {
    Project   = "terraweek-day5"
    ManagedBy = "Terraform"
    Day       = "05"
  }
}