# This file will define our AWS cloud provider.

provider "aws" {
  access_key = var.ACCESS_KEY_ID
  secret_key = var.SECRET_ACCESS_KEY
  region     = var.AWS_REGION
}

