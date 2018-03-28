# This data source searches for the AMI in AWS, and returns the AMI ID
data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*WindowsTrainingAMI*"]
  }
}

resource "aws_instance" "windows" {
  ami           = "${data.aws_ami.windows.id}"
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
