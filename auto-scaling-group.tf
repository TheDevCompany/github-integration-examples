##################################
#### ASG for Presentation Tier ###
##################################

resource "aws_launch_template" "auto-scaling-group" {
  name_prefix   = "auto-scaling-group"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = "source_key"
  network_interfaces {
    subnet_id       = aws_subnet.public-web-subnet-1.id
    security_groups = [aws_security_group.webserver-security-group.id]
  }
}

##################################
#### ASG for Application Tier ###
##################################

resource "aws_launch_template" "auto-scaling-group-private" {
  name_prefix   = "auto-scaling-group-private"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = "source_key"

  network_interfaces {
    subnet_id       = aws_subnet.private-app-subnet-1.id
    security_groups = [aws_security_group.ssh-security-group.id]
  }
}
