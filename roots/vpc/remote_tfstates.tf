//terraform {
//  backend "s3" {
//    role_arn = "arn:aws:iam::242906888793:role/AWS_Sandbox"
//    bucket   = "abotyan-tfstates" #Note: bucket created manual
//    key      = "vpc/terraform.tfstate"
//    region   = "us-east-1"
//  }
//}

terraform {
  backend "s3" {
    role_arn = "arn:aws:iam::242906888793:role/AWS_Sandbox"
    bucket = "abotyan-terraformbackend"
    key = "vpc/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}