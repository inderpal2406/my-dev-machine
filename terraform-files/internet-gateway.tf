# This file will define the internet gateway attached to our main VPC for connectivity with internet.

resource "aws_internet_gateway" "main-vpc-igw" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
    Name      = "main-vpc-igw"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
}

