# This file will define our custom VPC.

resource "aws_vpc" "main-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  tags = {
    Name      = "main-vpc"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
}

