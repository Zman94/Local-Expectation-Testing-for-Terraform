### Global error.tf sym linked to each provider file ###

resource "aws_instance" "myweb" {
  instance_type = "t2.micro"
}
