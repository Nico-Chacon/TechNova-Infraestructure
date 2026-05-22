
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./infra/vpc"
}

module "sg" {
  source = "./infra/sg"

  vpc_id = module.vpc.vpc_id
  mi_ip  = "135.237.130.230/32"
}


module "ec2" {
  source = "./infra/ec2"
  subnet_public_web_id = module.vpc.subnet_public_web_id
  sg_ec2_id            = module.sg.sg_ec2_id
}

module "rds" {
  source = "./infra/rds"

  db_master_username = "admin"
  db_master_password = "Duoc.1234"
  db_name            = "technova"

  subnet_privada_datos1_id = module.vpc.subnet_private_datos1_id
  subnet_privada_datos2_id = module.vpc.subnet_private_datos2_id
  sg_rds_id                = module.sg.sg_rds_id
}


module "s3" {
  source      = "./infra/s3"
  bucket_name = "technova-cloudformation-templates-chacon"
}


