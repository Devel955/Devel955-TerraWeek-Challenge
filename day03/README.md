# TerraWeek Day 3 — Providers, Resources & First Cloud Infrastructure

**Status:** Completed ✅  
**Cloud:** AWS (ap-south-1 / Mumbai)  
**Date:** Tuesday, 14 July 2026

## Objective

This hands-on project provisions a small AWS network and compute stack with Terraform. It demonstrates provider configuration, data sources, reusable variables, outputs, and Terraform meta-arguments.

## What I built

- AWS provider pinned with `hashicorp/aws ~> 6.0`.
- Latest Amazon Linux 2023 AMI selected dynamically through `data.aws_ami`.
- VPC, public subnet, Internet Gateway, route table, and route-table association.
- Security Group allowing only HTTP (port 80); SSH is not opened.
- EC2 `t3.micro` web instance with Nginx installed through user data.
- Reusable tags, outputs, and a parameterised deployment environment.

## Meta-arguments practiced

| Meta-argument | Implementation |
|---|---|
| `count` | Creates the configured number of EC2 web instances. |
| `for_each` | Creates named HTTP ingress rules from a local map. |
| `depends_on` | Makes the EC2 instance wait for the route-table association. |
| `lifecycle` | Uses `create_before_destroy` and ignores external changes to `LastModified`. |

## Resource vs data source

- **Resources** create and manage AWS infrastructure, such as `aws_vpc` and `aws_instance`.
- **Data sources** read existing information without creating it, such as `aws_ami` and `aws_availability_zones`.

## Project structure

```text
day03/
├── README.md
├── example/
│   ├── versions.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── main.tf
│   └── outputs.tf
```

## Run it

> AWS credentials are not stored in this repository. Authenticate locally before running Terraform.

```bash
aws login
cd day03/example
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform state list
```

To inspect a safe update, change the `environment` variable from `dev` to `staging`, then run:

```bash
terraform plan
terraform apply
```

## Cleanup

This project creates billable AWS resources while they are running. Always destroy them after testing:

```bash
terraform destroy
```

## Hands-on result

The Nginx page was successfully served from the Terraform-provisioned EC2 instance. The environment-tag update was applied in place, and the stack was destroyed successfully after verification.

## Key learnings

- Pin providers to keep Terraform runs predictable.
- Use data sources to avoid hard-coding AMI IDs and Availability Zones.
- Prefer `for_each` for stable, named resources.
- Review the plan before every apply and destroy resources to control cloud cost.

#TrainWithShubham #TerraWeekChallenge

## Proof screenshots

### Terraform initialization

### Terraform initialization

The AWS provider was installed and the Terraform working directory initialized successfully.

<img width="937" height="407" alt="Terraform initialized with the AWS provider" src="https://github.com/user-attachments/assets/62dd6e83-dcbc-45ad-9783-2322878fb3e2" />

### Nginx served from EC2

Nginx was served successfully from the Terraform-provisioned EC2 instance.

<img width="1221" height="221" alt="Nginx page served from Terraform EC2" src="https://github.com/user-attachments/assets/b0207b44-1eb0-4221-947a-f72aaa498295" />

### Terraform update plan

The environment-tag change was reviewed as an in-place update before applying it.

<img width="917" height="978" alt="Terraform update plan" src="https://github.com/user-attachments/assets/6a124ffb-5324-4028-af86-e588e355f717" />

### Cleanup proof

All nine AWS resources were removed with Terraform destroy.

<img width="720" height="440" alt="Terraform destroy complete" src="https://github.com/user-attachments/assets/945d33b2-9e12-4f36-8bd7-7b19959232f0" />

### EC2 instance running

AWS Console confirms the Terraform-provisioned t3.micro instance was running and passed its status checks.

<img width="1190" height="277" alt="EC2 instance running" src="https://github.com/user-attachments/assets/c2b939eb-7205-4b97-aa79-a65fc6e48449" />
