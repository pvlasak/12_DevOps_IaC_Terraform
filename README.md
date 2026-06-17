# 12_DevOps_IaC_Terraform

## Terraform commands
**branch learn** 
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

## Provisioning EC2 instance on AWS
**branch feature/provisioning_ec2**
- a new `VPC` gets created, inside the VPC a new `subnet` of specific IP address range given by VPC cidr block is defined. 
- to connect the VPC and subnet with internet, a `route table` must be created with `internet gateway` defined as a target.
- route table has to be associated with the subnet - *aws_route_table_association*
- inbound rules and outbound rules are set through `security group`
- set of linux command is started on the new ec2 instance *user_data = file("entry_script.sh")*
- `entry_script.sh` installs docker and makes sure that docker command can be run without root priviliges by adding an `ec2-user` to docker group.

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

## Terraform and EKS cluster
**branch feature/eks**
- vpc module : terraform-aws-modules/vpc/aws
- eks module: terraform-aws-modules/eks/aws
- nginx is deployed on the kubernetes cluster with the service defined as Loadbalancer