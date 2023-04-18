# resource "aws_iam_user" "lb" {
#   name = "kaizen"
# }


# resource "aws_iam_group" "developers" {
#   name = "developers"
# }

# resource "aws_iam_group_membership" "team" {
#   name = "tf-testing-group-membership"

#   users = [
#     aws_iam_user.lb.name,
#   ]

#   group = aws_iam_group.developers.name
# }

resource "aws_iam_user" "lb" {
    name = each.key
    for_each = toset([
        "kaizen",
        "kaizen1",
        "kaizen3"
    ])      
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket_prefix = "adilet"
}

# output users_info {
#     value = aws_iam_user.lb.arn
# }

output bucket_info {
    value = aws_s3_bucket.example.id
}

output key_info {
    value = aws_key_pair.deployer.arn
}