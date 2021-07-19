### Global fixed.tf sym linked to each provider file ###

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name    = "test7"
    Project = "HyperScale"
  }
}
