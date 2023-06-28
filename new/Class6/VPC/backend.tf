terraform {
  backend "s3" {
    bucket = "adilet"
    key    = "statefile"
    region = "us-east-2"
  }
}