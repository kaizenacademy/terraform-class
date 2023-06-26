terraform {
  backend "s3" {
    bucket = "my-bucket-kaizen"
    key    = "statefile"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
}