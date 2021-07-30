### Global error.tf sym linked to each provider file ###

resource "aws_dynamodb_table" "test_dynamo" {
  name         = "testtable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "testhash"
  attribute {
    name = "testhash"
    type = "S"
  }
  tags = {
    Name      = "test9"
    Project   = "HyperScale"
    TestType  = "Fixed"
    TimeStamp = "2021JUL23T1930"
  }
}

resource "aws_dynamodb_table_item" "test_dynamo" {
  table_name = aws_dynamodb_table.test_dynamo.name
  hash_key   = "testhash"
  item       = <<EOF
{
    "testhash": { "S": "This is a string"},
    "othervalue": { "N": "42" }
}
EOF
}
