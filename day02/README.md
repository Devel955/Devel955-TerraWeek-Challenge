# TerraWeek Day 2 — HCL Deep Dive: Variables, Types & Expressions

**Date:** 13 July 2026

Day 2 focused on writing flexible, reusable Terraform configurations with HCL, variables, validation, locals, outputs, functions, and variable precedence.

## HCL fundamentals

A Terraform block has a block type, optional labels, and a body:

```hcl
resource "docker_container" "web" {
  name = local.name_prefix
}
```

- `resource` is the block type.
- `"docker_container"` and `"web"` are labels.
- `name = local.name_prefix` is an argument.
- Expressions compute values, for example interpolation, references, and operators.

## Variables, types, and validation

The configuration includes every major variable category:

| Category | Types used |
| --- | --- |
| Primitive | `string`, `number`, `bool` |
| Collections | `list(string)`, `map(string)`, `set(string)` |
| Structural | `object(...)`, `tuple([...])` |

It also demonstrates defaults, validation rules, a sensitive `registry_token` variable, and an `optional()` object attribute.

## Locals, outputs, and functions

Locals calculate a reusable container name and merged Docker labels. Outputs expose the container name, ID, URL, messages, labels, and transformed names.

Functions explored: `upper()`, `merge()`, `join()`, `length()`, `format()`, and `lookup()`.

## Docker hands-on

Using the `kreuzwerker/docker` provider, Terraform pulled `nginx:alpine` and ran Nginx locally at `http://localhost:8080` with no cloud account or cost.

Completed workflow:

```text
Write → Init → Validate → Console → Plan → Apply → Output → Destroy
```

The run was tested twice:

1. With `-var` flags for one-off values.
2. With `terraform.tfvars` for reusable values, without `-var` flags.

## Variable precedence

Highest to lowest priority:

```text
-var / -var-file → *.auto.tfvars → terraform.tfvars → TF_VAR_ environment variables → defaults
```

## Bonus coverage

- ✅ For expression: `[for name in var.names : upper(name)]`
- ✅ Conditional expression: `var.environment == "prod" ? "t3.medium" : "t3.micro"`
- ✅ Optional object attribute: `optional(string, "no")`

## Run the example

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

For the `terraform.tfvars` approach:

```bash
cp terraform.tfvars.example terraform.tfvars
terraform plan
terraform apply
terraform destroy
```

## Evidence

See the [screenshots](./screenshots) folder for Terraform console, plan, running container, Nginx browser, output, and destroy proof.

> `terraform.tfvars`, Terraform state files, and the `.terraform` directory are intentionally excluded from version control.
