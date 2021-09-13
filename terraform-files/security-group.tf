# This file will define security groups being used for our EC2 instances.

# Allow SSH security group.

resource "aws_security_group" "allow-ssh-sg" {
  name        = "allow-ssh-sg"
  description = "Allow SSH inbound traffic from all IPv4 addresses."
  vpc_id      = aws_vpc.main-vpc.id

  ingress {
    description = "Allow inbound SSH traffic from everywhere."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "allow-ssh-sg"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
}

# Saltmaster security group

resource "aws_security_group" "saltmaster-sg" {
  name        = "saltmaster-sg"
  description = "Enable saltmaster and minion communication."
  vpc_id      = aws_vpc.main-vpc.id

  ingress {
    description = "Allow incoming traffic from minion on ports 4505-4506."
    from_port   = 4505
    to_port     = 4506
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    description = "Allow all outbound traffic."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "saltmaster-sg"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
}

