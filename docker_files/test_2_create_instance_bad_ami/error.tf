### Global error.tf sym linked to each provider file ###

resource "aws_instance" "myweb" {
  ami           = "ami-1111111111111"
  instance_type = "t2.micro"
  tags = {
    Name     = "test2"
    Project  = "HyperScale"
    TestType = "Error"
  }
}
