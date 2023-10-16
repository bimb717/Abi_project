resource "aws_instance" "app" {
  count = 1
  ami           = var.instance_app
  instance_type = "t2.micro"
  key_name = var.ec2_keypair_name
  vpc_security_group_ids = data.aws_security_groups.sgs.ids
  metadata_options {
    http_tokens   = "required"
    instance_metadata_tags = "enabled"
  }
  subnet_id   = data.aws_subnets.lb_subnet.ids[0]
  tags = {
    Name = "DevOpsApp"
    server_type = "app"
  }
  user_data = templatefile("installation.tftpl", {server_type = "app"})
}
