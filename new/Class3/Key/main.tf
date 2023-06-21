resource "aws_key_pair" "deployer" {
  key_name   = var.key
  public_key = file(var.file)
}

