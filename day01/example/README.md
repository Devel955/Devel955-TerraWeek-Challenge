# Day 1 example

This zero-cost Terraform configuration creates `greeting.txt` in the current directory. It uses the `local` and `random` providers only—no cloud account, credentials, or paid resources are involved.

## Run it

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
cat greeting.txt
terraform destroy
```

After `terraform apply`, Terraform prints the file path and generated random name. Run `terraform destroy` when finished to delete `greeting.txt` and clean up the state.

## Important files

- `main.tf` — provider requirements and local resources.
- `outputs.tf` — useful values printed after an apply.
- `.terraform.lock.hcl` — provider-version lock file; commit this file.
- `terraform.tfstate` — local state; do **not** commit it.
