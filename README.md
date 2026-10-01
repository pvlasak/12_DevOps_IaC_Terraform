# 12_DevOps_IaC_Terraform

## Terraform Modules 
**branch feature/modules**
- Terraform code is divided into two meaningful modules (subnet and webserver). 
- `subnet` module provides subnet, internet gateway and route table
- `webserver` module provides setup of security group and creates an ec2 instance 

- standard project structure:
    1. main.tf
    2. variables.tf
    3. outputs.tf
    4. providers.tf
- module should group at least 3-4 resources. 