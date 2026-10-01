## Provisioning EC2 instance on AWS
**branch feature/provisioning_ec2**
- a new `VPC` gets created, inside the VPC a new `subnet` of specific IP address range given by VPC cidr block is defined. 
- to connect the VPC and subnet with internet, a `route table` must be created with `internet gateway` defined as a target.
- route table has to be associated with the subnet - *aws_route_table_association*
- inbound rules and outbound rules are set through `security group`
- set of linux command is started on the new ec2 instance *user_data = file("entry_script.sh")*
- `entry_script.sh` installs docker and makes sure that docker command can be run without root priviliges by adding an `ec2-user` to docker group.