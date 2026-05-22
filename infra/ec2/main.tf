# ──────────────────────────────────────────────
# Instancia EC2 TechNova
# ──────────────────────────────────────────────

resource "aws_instance" "technova" {
  ami           = "ami-0fff1b9a61dec8a5f"   # Amazon Linux 2023 (us-east-1)
  instance_type = "t3.micro"
  key_name      = "technova-key"                  # Debe existir previamente en tu cuenta

  subnet_id              = var.subnet_public_web_id
  vpc_security_group_ids = [var.sg_ec2_id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    delete_on_termination = true
  }

  user_data = <<-EOF
              #!/bin/bash
              exec > /var/log/user-data.log 2>&1
              set -x

              yum update -y
              yum install -y docker

              systemctl enable docker
              systemctl start docker
              usermod -aG docker ec2-user
              newgrp docker

              mkdir -p /usr/local/lib/docker/cli-plugins
              curl -SL https://github.com/docker/compose/releases/download/v2.29.2/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
              chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

              yum install telnet -y
              yum install mariadb105 -y
              EOF

  tags = {
    Name     = "ec2-technova"
    Proyecto = "TechNova"
  }
}

# ──────────────────────────────────────────────
# Elastic IP
# ──────────────────────────────────────────────
resource "aws_eip" "technova" {
  domain = "vpc"

  tags = {
    Name     = "eip-technova"
    Proyecto = "TechNova"
  }
}

# Asociar Elastic IP a la instancia
resource "aws_eip_association" "technova_assoc" {
  instance_id   = aws_instance.technova.id
  allocation_id = aws_eip.technova.id
}


