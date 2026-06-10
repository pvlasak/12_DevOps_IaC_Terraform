# 12_DevOps_IaC_Terraform

## Terraform commands
- *terraform plan* - preview of actions that Terraform needs to do to achieve desired state
- *terraform apply* - apply configuration file describing the desired state. 
- *terraform apply -auto-approve* - apply command without confirmation
- *terraform destroy* - go through the all resources and delete them. 
- *terraform state show resource_name* - command that gives an overview of all attributes that are defined for the specific resource.

## Terraform Files
- *terraform.tfstate* - file describing the current state of resource configuration
- *terraform.tfstate.backup* - description of previous state before apply command
-*.terraform.lock.hcl* - keeps info about providers and versions
- *terraform.tfvars* - defintion of variables. 
- *main.tf* - main Terraform configuration file of sources and resources. 