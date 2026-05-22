# Security Group para EC2
resource "aws_security_group" "ec2_technova" {
  name        = "ec2-technova"
  description = "Security Group para instancias EC2 de TechNova"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH desde mi IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP publico"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS publico"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Backend puerto 3001"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "ec2-technova"
    Proyecto = "TechNova"
  }
}

# Security Group para RDS
resource "aws_security_group" "rds_technova" {
  name        = "rds-technova"
  description = "Security Group para RDS TechNova - solo acceso desde EC2"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL solo desde EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_technova.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name     = "rds-technova"
    Proyecto = "TechNova"
  }
}



