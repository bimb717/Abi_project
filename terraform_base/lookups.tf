data "aws_availability_zones" "azs" {}

data "aws_security_groups" "sgs" {
  filter {
    name   = "group-name"    
    values = ["launch-wizard-*"]
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