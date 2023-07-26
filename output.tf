
output "security_group" {
    value = data.aws_vpc_security_group_rule.test
}

output "app_instance_public_dns" {
  description = "Public IP address of the APP EC2 instance"
  value       = aws_instance.app.public_ip
}

output "web_instance_public_ip" {
  description = "Public IP address of the WEB EC2 instance"
  value       = aws_instance.web.public_ip
}