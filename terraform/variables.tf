variable "region" {
    default = "eu-central-1"
}

variable env_prefix {
    default = "dev"
}
variable vpc_cidr_block {
    default = "10.0.0.0/16"
}
variable subnet_cidr_block {
    default = "10.0.10.0/24"
}
variable avail_zone {
    default = "eu-central-1a"
}
variable my-ip {
    default = "212.11.106.250"
}
variable jenkins_ip {
    default = "64.226.125.108/32"
}
variable instance_type {
    default = "t2.micro"
}