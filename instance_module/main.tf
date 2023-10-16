resource "aws_instance" "ec2_instance" {
  count                  = 1
  ami                    = var.our_ami
  instance_type          = var.our_instance_type
  key_name               = var.abi_ec2_keypair_name
  vpc_security_group_ids = var.yinka_vpc_security_group_ids
  metadata_options {
    http_tokens            = "required"
    instance_metadata_tags = "enabled"
  }
  subnet_id = var.matt_subnet_ids
  tags = {
    Name        = var.yomi_name_tag
    server_type = var.anoop_server_type
    environment = var.gamu_environment
  }
  user_data = templatefile("installation.tftpl", { server_type = var.anoop_server_type })
}
