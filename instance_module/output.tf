output "instance_id" {
  description = "Public IP addresses of the WEB EC2 instances"
  value       = aws_instance.ec2_instance.*.id
}