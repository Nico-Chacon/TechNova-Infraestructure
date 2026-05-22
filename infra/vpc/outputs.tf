output "vpc_id" {
  value = aws_vpc.technova.id
}

output "subnet_public_web_id" {
  value = aws_subnet.public_web.id
}

output "subnet_public_app_id" {
  value = aws_subnet.public_app.id
}

output "subnet_private_datos1_id" {
  value = aws_subnet.private_datos1.id
}

output "subnet_private_datos2_id" {
  value = aws_subnet.private_datos2.id
}

output "igw_id" {
  value = aws_internet_gateway.technova.id
}

output "rt_public_id" {
  value = aws_route_table.public_rt.id
}
