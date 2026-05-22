# ──────────────────────────────────────────────
# Subnet Group para RDS
# ──────────────────────────────────────────────
resource "aws_db_subnet_group" "technova" {
  name        = "subnet-group-technova"
  description = "Subnet group para RDS TechNova (subnets privadas de datos)"
  subnet_ids  = [var.subnet_privada_datos1_id, var.subnet_privada_datos2_id]

  tags = {
    Name     = "subnet-group-technova"
    Proyecto = "TechNova"
  }
}

# ──────────────────────────────────────────────
# Instancia RDS MySQL
# ──────────────────────────────────────────────
resource "aws_db_instance" "technova" {
  identifier           = "rds-technova"
  engine               = "mysql"
  engine_version       = "8.0"             
  instance_class       = "db.t3.micro"
  allocated_storage    = 30
  storage_type         = "gp3"
  storage_encrypted    = true

  username             = "admin"
  password             = var.db_master_password

  db_subnet_group_name = aws_db_subnet_group.technova.name
  vpc_security_group_ids = [var.sg_rds_id]
  publicly_accessible  = false
  availability_zone    = "us-east-1a"

  backup_retention_period = 0
  copy_tags_to_snapshot   = false
  multi_az                = false
  monitoring_interval     = 0

  skip_final_snapshot     = true   

  tags = {
    Name     = "rds-technova"
    Proyecto = "TechNova"
  }
}


