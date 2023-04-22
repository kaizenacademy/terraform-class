variable "region" {
    description = "Enter region"
    type = string
    default = ""    
}

variable "vpc_name" {
    description = "Enter vpc name"
    type = string
    default = ""    
}

variable "cidr_block" {
    description = "Enter cidr block"
    type = string
    default = ""    
}

variable "public_subnets" {
    description = "Enter public subnets"
    type = list
    default = []   
}

variable "private_subnets" {
    description = "Enter private subnets"
    type = list
    default = []   
}