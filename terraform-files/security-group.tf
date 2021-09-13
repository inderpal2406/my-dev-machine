# This file will define security groups being used for our EC2 instances.

# Allow all outgoing traffic.

resource "aws_security_group" "allow-all-outgoing-sg" {
  name		= "allow-all-outgoing-sg" 
  description	= "Allow all outgoing traffic from the instance."
  vpc_id	= aws_vpc.main-vpc.id

  egress {
    description = "Allow all outgoing traffic from the instance."
    from_port	= 0
    to_port	= 0
    protocol	= "-1"
    cidr_blocks	= ["0.0.0.0/0"]
  }

  tags		= {
    Name	= "allow-all-outgoing-sg"
    ManagedBy	= "terraform"
    Owner	= "Inderpal Singh"
  }
}

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

  tags = {
    Name      = "saltmaster-sg"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
}

# Security group to allow incoming HTTP/HTTPS (web) traffic.

resource "aws_security_group" "allow-http-https-sg" {
  name		= "allow-http-https-sg"
  description	= "Allow incoming HTTP/HTTPS (web) traffic."
  vpc_id	= aws_vpc.main-vpc.id

  ingress {
    description = "Allow incoming HTTP (web) traffic."
    from_port	= 80
    to_port	= 80
    protocol	= "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description	= "Allow incmoing HTTPS (web) traffic."
    from_port	= 443
    to_port	= 443
    protocol	= "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }

  tags		= {
    Name	= "allow-http-https-sg"
    ManagedBy	= "terraform"
    Owner	= "Inderpal Singh"
  }
}

