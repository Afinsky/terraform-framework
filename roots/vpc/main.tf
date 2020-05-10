module "vpc" {
  source = "../../modules/vpc/"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  database_subnets = var.database_subnets

  #single_nat_gateway = true

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = merge({
    Terraform = "true"
    Contributor = "abotyan"
  },
   local.common_tags)

}