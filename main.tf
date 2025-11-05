provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  project         = var.project
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# EC2 Instance Module
module "ec2_instance" {
  source = "./modules/ec2-instance"

  instances  = var.instances
  subnet_ids = merge(
    module.vpc.public_subnet_ids,
    module.vpc.private_subnet_ids
  )
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "my_bucket" {
  bucket = "infra-tfstate-01"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket       = "infra-tfstate-01"
    key          = "terraform.tfstate"
    region       = "us-east-2"
    use_lockfile = true
    encrypt      = true
  }
}
