module "dev-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "dev-vpc"
  cidr = "10.0.0.0/16"

  azs              = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  database_subnets = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]

  enable_nat_gateway                 = true
  enable_vpn_gateway                 = false
  single_nat_gateway                 = true
  enable_dns_support                 = true
  enable_dns_hostnames               = true
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  create_database_nat_gateway_route  = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "prd-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "prd-vpc"
  cidr = "10.10.0.0/16"

  azs              = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets   = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  private_subnets  = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
  database_subnets = ["10.10.7.0/24", "10.10.8.0/24", "10.10.9.0/24"]

  enable_nat_gateway                 = true
  enable_vpn_gateway                 = false
  single_nat_gateway                 = false
  enable_dns_support                 = true
  enable_dns_hostnames               = true
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  create_database_nat_gateway_route  = true
  tags = {
    Terraform   = "true"
    Environment = "prd"
  }
}