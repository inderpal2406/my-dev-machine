# This file will define the route table associated with public subnet.

resource "aws_route_table" "main-vpc-public-subnet-RT" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-vpc-igw.id
  }
  tags = {
    Name      = "main-vpc-public-subnet-RT"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
}
