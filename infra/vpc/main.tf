# ──────────────────────────────────────────────
# VPC TechNova
# ──────────────────────────────────────────────
resource "aws_vpc" "technova" {
  cidr_block           = "10.0.0.0/22"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-technova"
  }
}

# ──────────────────────────────────────────────
# Subnets
# ──────────────────────────────────────────────

# Pública - Web (us-east-1a)
resource "aws_subnet" "public_web" {
  vpc_id                  = aws_vpc.technova.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-publica-web"
  }
}

# Pública - App (us-east-1a)
resource "aws_subnet" "public_app" {
  vpc_id                  = aws_vpc.technova.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-publica-app"
  }
}

# Privada - Datos 1 (us-east-1a)
resource "aws_subnet" "private_datos1" {
  vpc_id                  = aws_vpc.technova.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "subnet-privada-datos-1"
  }
}

# Privada - Datos 2 (us-east-1b)
resource "aws_subnet" "private_datos2" {
  vpc_id                  = aws_vpc.technova.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "subnet-privada-datos-2"
  }
}

# ──────────────────────────────────────────────
# Internet Gateway
# ──────────────────────────────────────────────
resource "aws_internet_gateway" "technova" {
  vpc_id = aws_vpc.technova.id

  tags = {
    Name = "igw-technova"
  }
}

# ──────────────────────────────────────────────
# Route Table pública
# ──────────────────────────────────────────────
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.technova.id

  tags = {
    Name = "rt-publica-technova"
  }
}

# Ruta por defecto → IGW
resource "aws_route" "public_default" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.technova.id
}

# Asociaciones de subnets públicas
resource "aws_route_table_association" "public_web_assoc" {
  subnet_id      = aws_subnet.public_web.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_app_assoc" {
  subnet_id      = aws_subnet.public_app.id
  route_table_id = aws_route_table.public_rt.id
}


