# resource "aws_iam_user" "lb" {
#   name = "loadbalancer"
# }

# resource "aws_iam_user" "lb1" {
#   name = "loadbalancer1"
# }

# resource "aws_iam_user" "lb2" {
#   name = "loadbalancer2"
# }

# resource "aws_iam_group" "developers" {
#   name = "developers"
# }

# resource "aws_iam_group_membership" "team" {
#   name = "tf-testing-group-membership"

#   users = [
#     aws_iam_user.lb.name,
#     aws_iam_user.lb1.name,
#     aws_iam_user.lb2.name
#   ]

#   group = aws_iam_group.developers.name
# }

# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }

# resource "aws_key_pair" "deployer1" {
#   key_name   = "deployer-key1"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

# resource "aws_s3_bucket" "bucket" {
#   bucket_prefix = "adilet-bucket-"
# }

# output bucket_info {
#   value = aws_s3_bucket.bucket.bucket
# }

resource "aws_iam_user" "name" {
  name = each.key
  for_each = toset([
    "loadbalancer",
    "loadbalancer1",
    "loadbalancer2"
  ])
}


resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [for user in aws_iam_user.name : user.name]

  group = aws_iam_group.developers.name
}

resource "aws_s3_bucket" "bucket"{
  bucket = "kaizen-adilet"
}

