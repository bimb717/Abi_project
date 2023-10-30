variable "ec2_keypair_name" {
  type    = string
  default = "test-keypari"
}
variable "security_group_names" {
  type    = list
  default = ["course-web-access", "launch-wizard-1"]
}
variable "vpc_id" {
  type    = string
  default = "vpc-2194715c"
}
variable "instance_app" {
  type    = string
  default = "ami-06ca3ca175f37dd66"
}
variable "instance_web_ami" {
  type    = string
  default = "ami-04a3fea0ceec717e5"
}