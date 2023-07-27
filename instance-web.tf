resource "aws_instance" "web" {
  ami           = "ami-06ca3ca175f37dd66"
  instance_type = "t2.small"
  key_name = "test-keypari"
  vpc_security_group_ids = ["sg-0f22883def1a84431", "sg-0f1c0a78a499ec6bf"]
  metadata_options {
    http_tokens   = "required"
    instance_metadata_tags = "enabled"
  }
  tags = {
    Name = "DevOpsWeb"
    server_type = "web"
    traffic_allowed = "Traffic allowed over ports ${data.aws_vpc_security_group_rule.test.from_port} from ${data.aws_vpc_security_group_rule.test.cidr_ipv4}"
  }
  user_data = templatefile("installation.tftpl", {server_type = "web"})
}
