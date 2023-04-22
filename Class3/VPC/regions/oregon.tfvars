region = "us-west-2"
vpc_name = "oregon-vpc"
cidr_block = "192.168.0.0/16"

private_subnets = [
    "192.168.1.0/24", 
    "192.168.2.0/24", 
    "192.168.3.0/24"
]

public_subnets  = [
    "192.168.101.0/24", 
    "192.168.102.0/24", 
    "192.168.103.0/24"
]