# TerraWeek Day 4 — State & Remote Backends

**Date:** Wednesday, 15 July 2026

Day 4 focused on Terraform state, remote backends, native S3 state locking, and importing existing infrastructure safely.

## What I learned

- Terraform state maps configuration to real infrastructure and must never be edited manually.
- State can contain sensitive values, so state files must not be committed to Git.
- An S3 remote backend makes team state storage more reliable than a local `terraform.tfstate` file.
- S3 native locking uses `use_lockfile = true` to prevent simultaneous state writes.
- Existing infrastructure can be brought under Terraform management with an `import` block.

## Hands-on completed

| Task | Result |
| --- | --- |
| Created a secure S3 state bucket | Versioning, AES256 encryption, and public-access blocking enabled |
| Created local Terraform state | Applied a local file resource before migration |
| Migrated state to S3 | Used `terraform init -migrate-state` |
| Verified remote state | Confirmed `terraform.tfstate` in the S3 backend |
| Demonstrated native locking | Captured `terraform.tfstate.tflock` during apply |
| Imported an existing bucket | Used `terraform plan -generate-config-out=generated.tf` and `terraform apply` |

## Repository structure

```text
day04/
├── README.md
├── backend_infra/       # Creates the secure S3 state bucket
├── backend_demo/        # Local-to-S3 state migration and lock demonstration
├── import_demo/         # Import-block example
└── screenshots/         # Real command and AWS Console proof
```

## Run the backend bootstrap

```bash
cd day04/backend_infra
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Migrate local state to S3

1. Run the demo locally once.
2. Copy `backend.tf.example` to `backend.tf`.
3. Replace the example bucket name with your own bucket.
4. Run:

```bash
terraform init -migrate-state
terraform plan
```

> Do not commit `terraform.tfstate`, `.terraform/`, `*.tfvars`, or your real `backend.tf`.

## Native lock proof

A `time_sleep` resource keeps `terraform apply` running long enough to verify the lock file:

```bash
aws s3 ls "s3://YOUR_STATE_BUCKET/day04/backend_demo/"
```

During the apply, the output contains both `terraform.tfstate` and `terraform.tfstate.tflock`.

## Import proof

```bash
cd day04/import_demo
terraform init
terraform plan -generate-config-out=generated.tf
terraform apply
terraform state list
terraform plan
```

The imported resource is shown as `aws_s3_bucket.imported`, followed by a no-changes plan.

## Proof screenshots

The `screenshots/` folder contains real command outputs and AWS Console proof for S3 backend creation, state migration, S3 locking, and import.

## Cleanup

After documenting the exercise, destroy the demo resources and delete the temporary imported bucket and S3 backend bucket to avoid charges.

#TrainWithShubham #TerraWeekChallenge
