region = "us-east-2"
vpc_name = "ohio-vpc"
cidr_block = "172.16.0.0/16"

private_subnets = [
    "172.16.1.0/24", 
    "172.16.2.0/24", 
    "172.16.3.0/24"
]

public_subnets  = [
    "172.16.101.0/24", 
    "172.16.102.0/24", 
    "172.16.103.0/24"
]
