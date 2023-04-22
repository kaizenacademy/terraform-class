variable "region" {
  description = "Enter zone"
  type = string
  default = "us-east-1"
}

variable "key_name" {
  description = "Enter key name"
  type = string
  default = "deployer-key"
}


variable "key_file" {
  description = "Enter file location"
  type = string
  default = "~/.ssh/id_rsa.pub"
}