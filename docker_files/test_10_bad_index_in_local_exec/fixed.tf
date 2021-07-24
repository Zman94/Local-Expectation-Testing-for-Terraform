resource "aws_vpc" "test_8_vpc" {
  count      = 2
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "test10"
    Project   = "HyperScale"
    TestType  = "Fixed"
    TimeStamp = "2021JUL23T1930"
  }
}

resource "null_resource" "possible_error" {
  provisioner "local-exec" {
    command = "echo ${aws_vpc.test_8_vpc[1].id}"
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.test_8_vpc[0].id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "my_public_subnet"
  }
}
