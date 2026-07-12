# TerraWeek Challenge

Hands-on Terraform learning journey for the **TerraWeek Challenge** by TrainWithShubham.

## Progress

| Day | Topic | Status |
| --- | --- | --- |
| [Day 01](./day01/README.md) | Introduction to IaC & Terraform Basics | Completed ✅ |
| Day 02–07 | Coming soon | Planned |

## Repository structure

```text
.
├── day01/
│   ├── README.md                 # Day 1 notes, commands, and proof
│   └── example/                  # Zero-cost Terraform example
│       ├── main.tf
│       ├── outputs.tf
│       └── README.md
├── .gitignore
└── README.md
```

## About

This repository documents my Terraform practice, command outputs, and screenshots. Each day is self-contained so it can be run and reviewed independently.

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

> The Day 1 example uses only the `local` and `random` providers. It does not need a cloud account or credentials and does not create any billable resources.

## Connect

- Challenge: #TrainWithShubham #TerraWeekChallenge
- Repository: [Devel955-TerraWeek-Challenge](https://github.com/Devel955/Devel955-TerraWeek-Challenge)
