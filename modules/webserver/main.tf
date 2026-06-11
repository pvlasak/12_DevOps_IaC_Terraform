resource "aws_security_group" "my-app-sg" {
    name = "myapp-sg"
    vpc_id = var.vpc_id 

    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = [var.my-ip]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        prefix_list_ids = []
    }
    tags = {
        Name: "${var.env_prefix}-sg"
    }
}



data "aws_ami" "latest_amazon_linux_image" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["amzn2-ami-kernel-*gp2"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

/*output "aws_ami" {
    value = data.aws_ami.latest_amazon_linux_image
}*/

resource "aws_instance" "myapp-server" {
    ami = data.aws_ami.latest_amazon_linux_image.id 
    instance_type = var.instance_type

    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.my-app-sg.id]
    availability_zone = var.avail_zone

    associate_public_ip_address = true
    key_name = aws_key_pair.ssh-key.key_name

    user_data = <<EOF
                #!/bin/bash
                sudo yum update -y && sudo yum install docker -y
                sudo systemctl start docker
                sudo usermod -aG docker ec2-user
                docker run -p 8080:80 nginx
            EOF
    
    user_data_replace_on_change = true

    tags = {
        Name: "${var.env_prefix}-server"
    }
}

resource "aws_key_pair" "ssh-key" {
    key_name = "server-key"
    public_key = file(var.public_key_location)
}