# TerraWeek Challenge

Hands-on Terraform learning journey for the **TerraWeek Challenge** by TrainWithShubham.

## Progress

| Day | Topic | Status |
| --- | --- | --- |
| [Day 01](day01/README.md) | Introduction to IaC & Terraform Basics | Completed ✅ |
| [Day 02](day02/README.md) | HCL Deep Dive: Variables, Types & Expressions | Completed ✅ |
| [Day 03](day03/README.md) | Providers, Resources & First Cloud Infrastructure | Completed ✅ |
| [Day 04](day04/README.md) | Terraform State & Remote Backends | Completed ✅ |
| [Day 05](day05/README.md) | Modules: Reusable, Composable Infrastructure | Completed ✅ |
| Day 06–07 | Coming soon | Planned |

## Repository structure

```text
.
├── day01/              # IaC foundations and zero-cost Terraform example
├── day02/              # HCL, variables, Docker, and Nginx hands-on
├── day03/              # AWS provider, VPC, EC2, and lifecycle hands-on
├── day04/              # State, S3 remote backend, locking, and import practice
├── day05/              # Reusable EC2 module, for_each, and Registry module versioning
├── .gitignore
└── README.md
```

## About

Each day is self-contained and documents Terraform code, commands, learnings, and practical proof screenshots.

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

> Day 2 runs Nginx locally with Docker. See the [Day 2 README](day02/README.md) for proof screenshots.

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

> Day 3 provisions real AWS resources while `terraform apply` is running. Review the plan and always run `terraform destroy` after testing.

## Run Day 4

```bash
cd day04/backend_infra
terraform init
terraform apply

cd ../backend_demo
terraform init -migrate-state
terraform plan
```

> Day 4 demonstrates remote state in Amazon S3, state locking, and importing an existing S3 bucket. The temporary AWS resources were cleaned up after the hands-on exercise.

## Run Day 5

```bash
cd day05/example
terraform init
terraform fmt
terraform validate
terraform plan -var="create_multiple_servers=true"
terraform apply
terraform destroy
```

> Day 5 uses a reusable EC2 child module. It also includes a version-pinned Terraform Registry VPC module example, disabled by default to prevent unnecessary resource creation.

## Connect

- Challenge: #TrainWithShubham #TerraWeekChallenge
- Repository: [Devel955-TerraWeek-Challenge](https://github.com/Devel955/Devel955-TerraWeek-Challenge)
