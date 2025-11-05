region  = "us-east-2"
project = "sample"
key_pair_name = "ohio"

vpc_cidr = "10.0.0.0/16"

public_subnets = {
  public-sub1 = { cidr = "10.0.10.0/24", az = "us-east-2a" }
}

private_subnets = {
  private-sub2 = { cidr = "10.0.11.0/24", az = "us-east-2b" }
}

instances = {
  web-server = {
    ami_id        = "ami-0199d4b5b8b4fde0e" #Acual AMI For instance ami-0199d4b5b8b4fde0e
    instance_type = "t2.micro"
    subnet_key    = "public-sub1"
    tags          = { Role = "web", Env = "dev" }
  }
}