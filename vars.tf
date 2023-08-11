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