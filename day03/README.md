# TerraWeek Day 3 — Providers, Resources & First Cloud Infrastructure
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



### Terraform apply update

The environment tag was updated successfully in place.
<img width="920" height="1013" alt="clipboard" src="https://github.com/user-attachments/assets/2ac6ab19-80d5-4e37-ade0-4d9fbf1b6b2a" />


### Post-apply verification

Terraform confirmed that the deployed infrastructure matched the configuration with no pending changes.
<img width="922" height="347" alt="clipboard" src="https://github.com/user-attachments/assets/15be43e5-ccbe-43cc-a67a-65eb7151c912" />
