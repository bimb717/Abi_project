module "instance_app" {
  source = "../instance_module"

  our_ami = var.instance_app_ami
  our_instance_type = var.app_instance_type
  abi_ec2_keypair_name = "test-keypari"
  yinka_vpc_security_group_ids = data.aws_security_groups.sgs.ids
  matt_subnet_ids = data.aws_subnets.lb_subnet.ids[1]
  anoop_server_type = "app"
  gamu_environment = var.environment_name

}
