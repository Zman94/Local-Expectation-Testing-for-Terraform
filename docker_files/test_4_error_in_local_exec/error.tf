### Global error.tf sym linked to each provider file ###

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0becdd21957bf5764"
  instance_type = "t3.micro"

  provisioner "local-exec" {
    command = "echo ${self}"
  }

  tags = {
    Name    = "test4"
    Project = "HyperScale"
  }
}

# resource "null_resource" "health_check" {

#   provisioner "local-exec" {

#     command = "/bin/bash healthcheck.sh"
#   }
# }

# resource "aws_instance" "web_ooi" {
#   depends_on    = [aws_instance.web[7]]
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = "test_4_712"
#   }
# }
