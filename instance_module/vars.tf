variable "our_ami" {
  type    = string
  default = null
}
variable "our_instance_type" {
  type    = string
  default = null
}
variable "abi_ec2_keypair_name" {
  type    = string
  default = "test-keypari"
}
variable "gamu_environment" {
  type    = string
  default = null
}
variable "yomi_name_tag" {
  type    = string
  default = null
}
variable "anoop_server_type" {
  type    = string
  default = null
}
variable "matt_subnet_ids" {
  type    = string
  default = "test-keypari"
}
variable "yinka_vpc_security_group_ids" {
  type    = list(any)
  default = []
}
