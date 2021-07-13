### Global fixed.tf sym linked to each provider file ###
resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0becdd21957bf5764"
  instance_type = "t3.micro"

  tags = {
    Name = "test_4_712"
  }
  provisioner "local-exec" {
    command = "echo ${self.ami}"
  }
}
