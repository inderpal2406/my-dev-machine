# This file will define our subnets.

resource "aws_subnet" "main-vpc-public-subnet" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-southeast-1a"
  tags = {
    Name      = "main-vpc-public-subnet"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
}

# Associating main-vpc-public-subnet-1 to route table

resource "aws_route_table_association" "main-vpc-public-subnet-RT-association" {
  subnet_id      = aws_subnet.main-vpc-public-subnet.id
  route_table_id = aws_route_table.main-vpc-public-subnet-RT.id
}

