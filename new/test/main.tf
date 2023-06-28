provider "aws" {
    region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "adilet"
    key    = "statefile1"
    region = "us-east-2"
  }
}

module "ec2" {
  source  = "kaizenacademy/ec2/vpc"
  version = "0.0.1"
  region = "us-east-2"
vpc_cidr = "10.0.0.0/16"
public_cidr1 = "10.0.1.0/24"
public_cidr2 = "10.0.2.0/24"
public_cidr3 = "10.0.3.0/24"
private_cidr1 = "10.0.101.0/24"
private_cidr2 = "10.0.102.0/24"
private_cidr3 = "10.0.103.0/24"
key_name = "new-key"
instance_type = "t2.micro"
}