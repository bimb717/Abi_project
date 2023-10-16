module "instance" {
  source = "../instance_module"

  our_ami = var.instance_web_ami
  our_instance_type = var.web_instance_type
  abi_ec2_keypair_name = "test-keypari"
  yinka_vpc_security_group_ids = data.aws_security_groups.sgs.ids
  matt_subnet_ids = data.aws_subnets.lb_subnet.ids[1]
  yomi_name_tag = "Devops-Web2-dev"
  anoop_server_type = "web2"
  gamu_environment = var.environment_name

}