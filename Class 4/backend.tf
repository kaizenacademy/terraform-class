terraform {
  backend "s3" {
    bucket = "adilet-bucket-class"
    key    = "path/to/my/key"
    region = "us-east-1"
    dynamodb_table = "lock-table"
  }
}
