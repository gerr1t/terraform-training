resource "aws_instance" "windows" {
  ami           = "ami-026a9e01d4768ede8"
  instance_type = "t2.medium"

  # Associating the security group and making sure the instance is started in the correct subnet.
  vpc_security_group_ids = ["${aws_security_group.windows.id}"]
  subnet_id              = "subnet-01ef24cb191338867"

  tags {
    Name = "Gerrit Tamboer"
  }
}

output "windows_public_ip" {
  value = "${aws_instance.windows.public_ip}"
}

output "windows_instance_id" {
  value = "${aws_instance.windows.id}"
}
