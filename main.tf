# Main Terraform configuration for the infrastructure
# vpc module
module "vpc" {
  source = "./modules/vpc"
}

# Security Group module
module "sg" {
  source = "./modules/sg"

  vpc_id = module.vpc.vpc_id
}

# RDS MODULE (DB FIRST)
module "rds" {
  source = "./modules/rds"

  db_name         = "blogdb"
  db_username     = var.db_username
  db_password     = var.db_password
  private_subnets = module.vpc.private_subnets
  rds_sg          = module.sg.rds_sg_id
}

# EC2 MODULE
module "ec2" {
  source = "./modules/ec2"


  instance_type     = var.instance_type
  public_subnet_id  = module.vpc.public_subnets[0]
  private_subnet_id = module.vpc.private_subnets[0]

  frontend_sg = module.sg.frontend_sg_id
  backend_sg  = module.sg.backend_sg_id

  key_name = var.key_name

  # DB endpoint pass
  db_endpoint = module.rds.db_endpoint

  # IMPORTANT: ensure RDS ready before EC2
  depends_on = [module.rds]
}

# ALB MODULE
module "alb" {
  source = "./modules/alb"

  vpc_id               = module.vpc.vpc_id
  public_subnets       = module.vpc.public_subnets
  alb_sg               = module.sg.alb_sg_id
  frontend_instance_id = module.ec2.frontend_instance_id
}
