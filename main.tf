provider "aws" {
  region = var.region
  profile = "<>"
}

module "vpc" {
  source = "./modules/vpc"
}