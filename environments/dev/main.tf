# Deploy VPC module
module "vpc" {
  source = "../../modules/vpc"

  vpc_name               = "dev-vpc"
  vpc_cidr               = var.vpc_cidr
  public_subnet_cidrs    = var.public_subnet_cidrs
  private_subnet_cidrs   = var.private_subnet_cidrs
  availability_zones     = var.availability_zones
  env                    = var.env
}

# Deploy ALB module
module "alb" {
  source = "../../modules/alb"

  env        = var.env
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  alb_name   = "nginx-alb"
}