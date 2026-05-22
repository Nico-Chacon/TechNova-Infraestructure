
output "sg_ec2_id" {
  description = "ID de sg-ec2-technova"
  value       = aws_security_group.ec2_technova.id
}

output "sg_rds_id" {
  description = "ID de sg-rds-technova"
  value       = aws_security_group.rds_technova.id
}

output "sg_ec2_name" {
  description = "Nombre del SG EC2"
  value       = aws_security_group.ec2_technova.name
}

output "sg_rds_name" {
  description = "Nombre del SG RDS"
  value       = aws_security_group.rds_technova.name
}
