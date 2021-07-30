### Moto Provider ###

### LocalStack Provider ###
provider "aws" {
  # ... potentially other provider configuration ...
  region = "us-east-1"
  endpoints {
    sts = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
  }
}

### AWS Provider ###
