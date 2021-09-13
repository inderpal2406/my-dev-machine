# Define EC2 instance

# saltmaster

resource "aws_instance" "saltmaster" {
  ami                    = "ami-0292c68e0ac530398"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.linux-ssh-key.id
  subnet_id              = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id, aws_security_group.saltmaster-sg.id]
  private_ip             = "10.0.1.4"
  tags = {
    Name      = "saltmaster"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.saltmaster.public_ip} >> public_ip.txt"
  }
  user_data = file("bash_scripts/configure_saltmaster.sh")
}

# my-dev-machine

resource "aws_instance" "my-dev-machine" {
  ami                    = "ami-0292c68e0ac530398"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.linux-ssh-key.id
  subnet_id              = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  private_ip             = "10.0.1.5"
  tags = {
    Name      = "my-dev-machine"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.my-dev-machine.public_ip} >> public_ip.txt"
  }
  user_data = file("bash_scripts/configure_saltminion_my-dev-machine.sh")
}

# DEV web server

resource "aws_instance" "dev-web-01" {
  ami                    = "ami-0292c68e0ac530398"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.linux-ssh-key.id
  subnet_id              = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  private_ip             = "10.0.1.6"
  tags = {
    Name      = "dev-web-01"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.dev-web-01.public_ip} >> public_ip.txt"
  }
  user_data = file("bash_scripts/configure_saltminion_dev-web-01.sh")
}

# Temporary test machine

resource "aws_instance" "test-machine" {
  ami                    = "ami-0292c68e0ac530398"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.linux-ssh-key.id
  subnet_id              = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  private_ip             = "10.0.1.7"
  tags = {
    Name      = "test-machine"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.test-machine.public_ip} >> public_ip.txt"
  }
  user_data = file("bash_scripts/configure_saltminion_test-machine.sh")
}

# DEV database server.

resource "aws_instance" "dev-db-01" {
  ami                    = "ami-0292c68e0ac530398"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.linux-ssh-key.id
  subnet_id              = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  private_ip             = "10.0.1.8"
  tags = {
    Name      = "dev-db-01"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
  user_data = file("bash_scripts/configure_saltminion_dev-db-01.sh")
}

# Staging WEB server.

resource "aws_instance" "staging-web-01" {
  ami			 = "ami-0292c68e0ac530398"
  instance_type		 = "t2.micro"
  key_name		 = aws_key_pair.linux-ssh-key.id
  subnet_id		 = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  private_ip		 = "10.0.1.9"
  tags			 = {
    Name		 = "staging-web-01"
    ManagedBy		 = "terraform"
    Owner		 = "Inderpal Singh"
  }
  user_data		 = file("bash_scripts/configure_saltminion_staging-web-01.sh")
}

# Staging DB server.

resource "aws_instance" "staging-db-01" {
  ami			 = "ami-0292c68e0ac530398"
  instance_type		 = "t2.micro"
  key_name		 = aws_key_pair.linux-ssh-key.id
  subnet_id		 = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  private_ip		 = "10.0.1.10"
  tags			 = {
    Name		 = "staging-db-01"
    ManagedBy		 = "terraform"
    Owner		 = "Inderpal Singh"
  }
  user_data		 = file("bash_scripts/configure_saltminion_staging-db-01.sh")
}

# Production WEB server

resource "aws_instance" "prod-web-01" {
  ami			 = "ami-0292c68e0ac530398"
  instance_type		 = "t2.micro"
  key_name		 = aws_key_pair.linux-ssh-key.id
  subnet_id		 = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  private_ip		 = "10.0.1.11"
  tags			 = {
    Name		 = "prod-web-01"
    ManagedBy		 = "terraform"
    Owner		 = "Inderpal Singh"
  }
  user_data		 = file("bash_scripts/configure_saltminion_prod-web-01.sh")
}

# Production DB server

resource "aws_instance" "prod-db-01" {
  ami			 = "ami-0292c68e0ac530398"
  instance_type		 = "t2.micro"
  key_name		 = aws_key_pair.linux-ssh-key.id
  subnet_id		 = aws_subnet.main-vpc-public-subnet.id
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  private_ip		 = "10.0.1.12"
  tags			 = {
    Name		 = "prod-db-01"
    ManagedBy		 = "terraform"
    Owner		 = "Inderpal Singh"
  }
  user_data		 = file("bash_scripts/configure_saltminion_prod-db-01.sh")
}

