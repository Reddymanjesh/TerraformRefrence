resource "aws_instance" "instance" {
  count                  = 1
  instance_type          = "t2.micro"
  ami                    = "ami-0ac019f4fcb7cb7e6"
  key_name               = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  subnet_id              = "${aws_subnet.subnet1.id}"

  root_block_device {
    volume_size = 8
  }

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "Server"
  }
}
