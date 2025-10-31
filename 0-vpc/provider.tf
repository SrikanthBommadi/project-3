terraform {
  backend "s3" {
    bucket       = "reddy.tf"
    key          = "sri-dev-vpc"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = "us-east-1"
}
