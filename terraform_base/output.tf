# output "app_instance_public_ip" {
#   description = "Public IP addresses of the APP EC2 instances"
#   value       = aws_instance.app.*.public_ip
# }

output "web_instance_public_ip" {
  description = "Public IP addresses of the WEB EC2 instances"
  value       = aws_instance.web.*.public_ip
}

data "aws_security_group" "sg" {
  id = "sg-0f1c0a78a499ec6bf"
}

output "security_group" {
  value = data.aws_security_group.sg
}

# output "securitygroups" {
#   value = data.aws_security_groups.sgs
# }

# output "subnets" {
#   value = data.aws_subnets.lb_subnet
# }

output "load_balancer_public_dns" {
  description = "Public IP address of the load balancer"
  value       = aws_lb.lb.dns_name
}

# output "aws_availability_zones" {
#   description = "availability zones"
#   value       = data.aws_availability_zones.azs
# }