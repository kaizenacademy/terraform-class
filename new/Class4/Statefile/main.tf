resource "aws_key_pair" "deployer1" {
  key_name   = "deployer-key1"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    Name = "Kaizen"
    Team = "DevOps"
    Env = "Dev"
  }
}