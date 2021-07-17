### Moto Provider ###

provider "aws" {
  # ... potentially other provider configuration ...
  region = "us-east-1"
  endpoints {
    ec2 = "http://localhost:13000"
    sts = "http://localhost:13000"

  }
}

### LocalStack Provider ###

### AWS Provider ###
