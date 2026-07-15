# TerraWeek Challenge

Hands-on Terraform learning journey for the **TerraWeek Challenge** by TrainWithShubham.

## Progress

| Day | Topic | Status |
| --- | --- | --- |
| [Day 01](./day01/README.md) | Introduction to IaC & Terraform Basics | Completed ✅ |
| [Day 02](./day02/README.md) | HCL Deep Dive: Variables, Types & Expressions | Completed ✅ |
| [Day 03](./day03/README.md) | Providers, Resources & First Cloud Infrastructure | Completed ✅ |
| Day 04–07 | Coming soon | Planned |

## Repository structure

```text
.
├── day01/                 # IaC foundations and zero-cost Terraform example
├── day02/                 # HCL, variables, Docker, and Nginx hands-on
├── day03/                 # AWS provider, VPC, EC2, and lifecycle hands-on
│   ├── README.md
│   └── example/
│       ├── versions.tf
│       ├── variables.tf
│       ├── locals.tf
│       ├── main.tf
│       └── outputs.tf
├── .gitignore
└── README.md
```

## About

Each day is self-contained and documents Terraform code, commands, learnings, and practical proof.

## Run Day 1

```bash
cd day01/example
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

> Day 1 uses only the `local` and `random` providers. No cloud account or billable cloud resources are required.

## Run Day 2

```bash
cd day02/example
terraform init
terraform fmt
terraform validate
terraform plan -var 'container_name=tws-web' -var 'external_port=8080'
terraform apply -var 'container_name=tws-web' -var 'external_port=8080'
terraform output
terraform destroy -var 'container_name=tws-web' -var 'external_port=8080'
```

> Day 2 runs Nginx locally with Docker. See the [Day 2 README](./day02/README.md) for proof screenshots.

## Run Day 3

```bash
aws login
cd day03/example
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform state list
terraform destroy
```

> Day 3 provisions real AWS resources while `terraform apply` is running. Review the plan and always run `terraform destroy` after testing. See the [Day 3 README](./day03/README.md) for architecture, meta-arguments, and results.

## Connect

- Challenge: #TrainWithShubham #TerraWeekChallenge
- Repository: [Devel955-TerraWeek-Challenge](https://github.com/Devel955/Devel955-TerraWeek-Challenge)
