data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  #count = 3
  availability_zone = "us-east-1a"
  key_name = aws_key_pair.deployer1.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("httpd.sh")

  tags = local.common_tags
}

resource "aws_key_pair" "deployer1" {
  key_name   = "deployer-key1"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = local.common_tags
}

output ec2 {
    value = aws_instance.web.arn
}

output ec21 {
    value = aws_instance.web.id
}

output ec22 {
    value = aws_instance.web.public_ip
}

output ec23 {
    value = aws_instance.web.instance_type
}