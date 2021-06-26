vpc_name             = "vpc-eks"
vpc_cidr             = "10.0.0.0/16"
project              = "poc"
environment          = "lab"
public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets_cidr = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
region               = "us-east-1"