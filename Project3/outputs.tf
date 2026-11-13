output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "Amazon Resource Name (ARN) of the VPC"
  value       = aws_vpc.vpc.arn
}

output "app_server_instance_id" {
  description = "EC2 instance ID of the application server"
  value       = aws_instance.app_server_1.id
}

output "app_server_private_ip" {
  description = "Private IPv4 address of the application server"
  value       = aws_instance.app_server_1.private_ip
}

output "igw_id" {
  description = "ID of the Internet Gateway attached to the VPC"
  value       = aws_internet_gateway.igw.id
}

output "ngw_ip" {
  description = "Public IPv4 address of the NAT Gateway"
  value       = aws_nat_gateway.nat_gw.public_ip
}

output "web_server_az" {
  description = "Availability Zone where the web server is deployed"
  value       = aws_instance.web_server_1.availability_zone
}