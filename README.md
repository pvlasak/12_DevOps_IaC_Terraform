## Complete CICD pipeline with Terraform
**branch jenkinsfile-sshagent**
- SSH private key has to be existing on AWS and must be available for Jenkins as credential.
- Terraform has to be installed inside jenkins container running on jenkins server
- because the `terraform.tfvars` is not pushed to git repository, all variables inside terraform script must be defined either by default values or by environmental variables TF_VAR_{variable_name} to be available for Jenkins. 
- ec2 server is provisioned by `main.tf` and *user_data* tool let's AWS to start `entry-script.sh` to install docker and docker compose subsequently.
- once ec2 server is provisioned an IP address is saved to groovy variable *EC2_PUBLIC_IP* and variable is later used in deploy stage. SSHagent plugin allows Jenkins to copy `server-cmds.sh` and `docker-compose.yaml` to EC2 and run the bash script, that deploys application.