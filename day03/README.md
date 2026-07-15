# TerraWeek Day 3 — Providers, Resources & First Cloud Infrastructure

**Status:** Completed ✅  
**Cloud:** AWS (ap-south-1 / Mumbai)  
**Date:** Tuesday, 14 July 2026

## Objective

This hands-on project provisions a complete AWS networking and compute stack using Terraform. It demonstrates provider configuration, data sources, reusable variables, outputs, resource dependencies, and safe cloud cleanup.

## What I built

- AWS provider pinned with <code>hashicorp/aws ~> 6.0</code>.
- Latest Amazon Linux 2023 AMI selected dynamically with <code>data.aws_ami</code>.
- VPC, public subnet, Internet Gateway, route table, and route-table association.
- Security Group allowing HTTP traffic on port 80; SSH is not opened.
- EC2 <code>t3.micro</code> web instance with Nginx installed through user data.
- Reusable tags, validated variables, local values, and useful Terraform outputs.

## Terraform concepts practiced

| Concept | Implementation |
|---|---|
| Provider | AWS provider configured for the Mumbai region. |
| Resource | VPC, subnet, Internet Gateway, route table, security group, and EC2 instance. |
| Data source | Latest Amazon Linux 2023 AMI and availability zones are read dynamically. |
| <code>count</code> | Creates the configured number of web instances. |
| <code>for_each</code> | Creates named HTTP ingress rules from a local map. |
| <code>depends_on</code> | Ensures the EC2 instance waits for the route-table association. |
| <code>lifecycle</code> | Uses <code>create_before_destroy</code> and ignores external <code>LastModified</code> changes. |

## Project structure

~~~text
day03/
├── README.md
└── example/
    ├── versions.tf
    ├── variables.tf
    ├── locals.tf
    ├── main.tf
    └── outputs.tf
~~~

## Run the project

> AWS credentials are not stored in this repository. Authenticate locally before running Terraform.

~~~bash
aws login
cd day03/example
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform state list
~~~

To review a safe in-place update, change the <code>environment</code> variable from <code>dev</code> to <code>staging</code>, then run:

~~~bash
terraform plan
terraform apply
~~~

## Cleanup

This project creates billable AWS resources while they are running. Always clean up after testing:

~~~bash
terraform destroy
~~~

## Key learnings

- Pinning providers keeps Terraform runs predictable.
- Data sources prevent hard-coded AMI IDs and Availability Zones.
- <code>for_each</code> gives stable, named resource management.
- Always review <code>terraform plan</code> before applying changes.
- Running <code>terraform destroy</code> prevents unnecessary AWS charges.

## Verification screenshots

> Screenshots below are from the real hands-on run. Sensitive AWS identifiers are redacted where necessary.

### 1. AWS CLI authentication

AWS CLI authentication was verified before provisioning resources.

<img width="447" height="191" alt="AWS CLI get caller identity with account values redacted" src="https://github.com/user-attachments/assets/4be1827b-e683-4191-a469-13799c85070f" />

### 2. Terraform initialization

The AWS provider was installed and the Terraform working directory initialized successfully.

<img width="937" height="407" alt="Terraform init with AWS provider" src="https://github.com/user-attachments/assets/62dd6e83-dcbc-45ad-9783-2322878fb3e2" />

### 3. Terraform update plan

The environment-tag update was reviewed before applying it. Terraform planned six in-place changes.

<img width="917" height="978" alt="Terraform update plan" src="https://github.com/user-attachments/assets/319311f3-ac41-4a99-a7ac-a1a97c89a374" />

### 4. Terraform apply update

The environment-tag update was applied successfully without creating or destroying resources.

<img width="920" height="1013" alt="Terraform apply update" src="https://github.com/user-attachments/assets/2ac6ab19-80d5-4e37-ade0-4d9fbf1b6b2a" />

### 5. Post-apply verification

Terraform confirmed that the deployed infrastructure matched the configuration with no pending changes.

<img width="922" height="347" alt="Terraform plan no changes" src="https://github.com/user-attachments/assets/15be43e5-ccbe-43cc-a67a-65eb7151c912" />

### 6. EC2 instance running

AWS Console confirms the Terraform-provisioned <code>t3.micro</code> instance was running and passed its status checks.

<img width="1190" height="277" alt="EC2 instance running in AWS Console" src="https://github.com/user-attachments/assets/c2b939eb-7205-4b97-aa79-a65fc6e48449" />

### 7. Nginx served from EC2

Nginx was served successfully from the public IP of the Terraform-provisioned EC2 instance.

<img width="1221" height="221" alt="Nginx page served from Terraform EC2" src="https://github.com/user-attachments/assets/b0207b44-1eb0-4221-947a-f72aaa498295" />

### 8. VPC available in AWS Console

The Terraform-created VPC was available and in the **Available** state in AWS Console.

<img width="1222" height="721" alt="Terraform-created VPC in AWS Console" src="https://github.com/user-attachments/assets/51ca2c40-bdc2-4f3f-8f2c-c9a5bc0b9af4" />

### 9. Cleanup completed

All nine AWS resources were removed successfully using <code>terraform destroy</code>.

<img width="720" height="440" alt="Terraform destroy complete" src="https://github.com/user-attachments/assets/945d33b2-9e12-4f36-8bd7-7b19959232f0" />

#TrainWithShubham #TerraWeekChallenge
