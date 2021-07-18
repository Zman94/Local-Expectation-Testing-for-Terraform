### Global error.tf sym linked to each provider file ###

resource "aws_dynamodb_table" "test_dynamo" {
  name        = "test-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key       = "test-hash"
  attribute {
    name = "test-hash"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "test_dynamo" {
    table_name = aws_dynamodb_table.test_dynamo.name
    hash_key = "test-hash"
    item = <<EOF
{
    "test-hash": { "S": "This is a string"},
    "othervalue": { "N": "42" }
}
EOF
}