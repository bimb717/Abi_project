module "instance" {
  source = "../instance_module"

  our_ami = "ami-06ca3ca175f37dd66"
  our_instance_type = "t2.micro"
  abi_ec2_keypair_name = "test-keypari"
  yinka_vpc_security_group_ids = data.aws_security_groups.sgs.ids
  matt_subnet_ids = data.aws_subnets.lb_subnet.ids[1]
  yomi_name_tag = "Devops-Web-dev"
  anoop_server_type = "web"
  gamu_environment = "dev"

}
