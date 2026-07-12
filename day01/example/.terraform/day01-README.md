# 🌱 TerraWeek Day 1 — Introduction to IaC & Terraform Basics

**Date:** Sunday, 12th July 2026
**Challenge:** #TrainWithShubham #TerraWeekChallenge

---

## 📝 Task 1: Understanding IaC & Terraform

**What is Infrastructure as Code (IaC)?**
IaC means defining and managing infrastructure (servers, networks, storage) through code files instead of manually clicking around a cloud console. It solves problems like inconsistent environments, lack of version control, no audit trail, and slow/error-prone manual setup. With IaC, infrastructure becomes repeatable, reviewable, and version-controlled just like application code.

**What is Terraform, and why is it popular?**
Terraform is an open-source IaC tool by HashiCorp that lets you define infrastructure declaratively using HCL (HashiCorp Configuration Language). It's popular because it's:
- **Declarative** — you describe the desired end state, and Terraform figures out how to get there.
- **Provider-agnostic** — works with AWS, Azure, GCP, and hundreds of other providers using the same workflow.
- **Backed by a huge ecosystem** — a massive registry of providers and community modules.

**Terraform vs Alternatives:**
| Tool | One-line comparison |
|---|---|
| **OpenTofu** | Open-source fork of Terraform with identical syntax — a community-driven alternative after Terraform's license change. |
| **Pulumi** | Uses real programming languages (Python, TypeScript, Go) instead of HCL, appealing to developers who prefer general-purpose code. |
| **CloudFormation** | AWS-only IaC tool, tightly integrated with AWS but not usable for multi-cloud setups. |
| **Ansible** | Primarily a configuration management tool (installing software, configuring servers) rather than a provisioning tool, though it can do some provisioning too. |

---

## 🔧 Task 2: Installing Terraform

Installed **Terraform v1.15.8** on Windows (amd64) and verified with:

```bash
terraform version
terraform -help
```

✅ Output confirmed: `Terraform v1.15.8 on windows_amd64`

Also installed the **HashiCorp Terraform** extension in VS Code for syntax highlighting and autocompletion.

---

## 📚 Task 3: Six Crucial Terraform Terminologies

1. **Provider** — A plugin that lets Terraform communicate with a specific platform. Example: the `hashicorp/aws` provider lets Terraform create AWS resources.
2. **Resource** — A single piece of infrastructure you want Terraform to manage. Example: `resource "local_file" "greeting"` creates a text file on disk.
3. **State** — Terraform's record of what infrastructure it's currently managing, stored in `terraform.tfstate`. It's how Terraform knows what already exists.
4. **Plan** — A dry-run preview showing exactly what Terraform will create, change, or destroy before it touches anything.
5. **HCL** — HashiCorp Configuration Language, the declarative syntax used to write `.tf` files.
6. **Module** — A reusable, packaged bundle of Terraform configuration that can be called multiple times with different inputs.

---

## 🚀 Task 4: First Terraform Config (Local + Random Providers)

Built a zero-cost, credential-free config using the `random` and `local` providers.

**`main.tf`:**
```hcl
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "random_pet" "name" {
  length = 2
}

resource "local_file" "greeting" {
  filename = "${path.module}/greeting.txt"
  content  = "Hello, ${random_pet.name.id}! Welcome to Day 1 of TerraWeek Challenge 🚀"
}
```

**Workflow executed:**
```bash
terraform init       # ✅ initialized, installed random v3.9.0 & local v2.9.0
terraform fmt        # ✅ formatted
terraform validate   # ✅ "Success! The configuration is valid."
terraform plan       # ✅ Plan: 2 to add, 0 to change, 0 to destroy
terraform apply       # ✅ Apply complete! Resources: 2 added
cat greeting.txt      # ✅ "Hello, modest-cowbird! Welcome to Day 1 of TerraWeek Challenge 🚀"
terraform destroy     # ✅ Destroy complete! Resources: 2 destroyed
```

### Screenshots

*(See `/screenshots` folder in this repo)*

- `terraform version` output
- `terraform init` success
- `terraform validate` success
- `terraform plan` output
- `terraform apply` success + `greeting.txt` content
- `terraform destroy` success

---

## 🍫 Key Learning

The core Terraform workflow — **Write → Init → Plan → Apply → Destroy** — is the foundation for everything that comes next in this challenge. Running a real (if tiny) `terraform apply` end-to-end, with zero cloud cost, made the abstract idea of "Infrastructure as Code" concrete for the first time.

---

**#TrainWithShubham #TerraWeekChallenge**
