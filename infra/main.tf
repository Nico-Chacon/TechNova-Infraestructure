module "vpc" {
  source = "./vpc"
}

module "sg" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
  mi_ip  = "135.237.130.230/32"
}

module "rds" {
  source = "./rds"
  vpc_id = module.vpc.vpc_id
  sg_rds_id = module.sg.sg_rds_id
  subnet_privada_datos1_id = module.vpc.subnet_privada_datos1_id
  subnet_privada_datos2_id = module.vpc.subnet_privada_datos2_id
  db_master_username = "admin"
  db_master_password = "Duoc.1234"
  db_name            = "technova"
}

module "ec2" {
  source = "./ec2"
  vpc_id = module.vpc.vpc_id
  sg_ec2_id = module.sg.sg_ec2_id
  subnet_publica_web_id = module.vpc.subnet_publica_web_id
}

