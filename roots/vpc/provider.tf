provider "aws" {
  version = "~> 2.53"
  region = "us-east-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  assume_role {
    role_arn = "arn:aws:iam::242906888793:role/AWS_Sandbox"
  }
}

