# This file declares variables being used in our terraform files.
# The default values can be over-ridden from other files or terraform.tfvars file.

variable "ACCESS_KEY_ID" {
  type = string
}

variable "SECRET_ACCESS_KEY" {
  type = string
}

variable "AWS_REGION" {
  type    = string
  default = "ap-southeast-1"
}

variable "PUBLIC_SSH_KEY" {
  type = string
}

