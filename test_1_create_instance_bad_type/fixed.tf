### Global fixed.tf sym linked to each provider file ###

resource "aws_instance" "myweb" {
  ami           = "ami-0dc2d3e4c0f9ebd18"
  instance_type = "t2.micro"
  tags = {
    Name      = "test1"
    Project   = "HyperScale"
    TestType  = "Fixed"
    TimeStamp = "2021JUL23T1930"
  }
}
