data "aws_availability_zones" "azs" {}

data "aws_security_groups" "sgs" {
  filter {
    name   = "group-name"    
    values = var.security_group_names
  }
}

data "aws_subnets" "lb_subnet" {
  filter {
    name   = "tag:Name"    
    values = ["*Web*"]
  }
}

data "aws_vpc" "main_vpc" {
  id = var.vpc_id
}