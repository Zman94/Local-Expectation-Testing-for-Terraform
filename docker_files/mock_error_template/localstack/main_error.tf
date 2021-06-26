### Global main_error.tf sym linked to each provider file ###

resource "aws_instance" "myweb" {
  ami           = "ami-0e763a959ec839f5e"
  instance_type = "t2.micro"

  tags = {
    Name = "AkuDev"
  }
}