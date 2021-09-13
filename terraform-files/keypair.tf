# This file will define our AWS keypair resource which will be used to login to the Linux instances via ssh.

resource "aws_key_pair" "linux-ssh-key" {
  key_name   = "linux-ssh-key"
  public_key = var.PUBLIC_SSH_KEY
  tags = {
    Name      = "linux-ssh-key"
    ManagedBy = "terraform"
    Owner     = "Inderpal Singh"
  }
}

