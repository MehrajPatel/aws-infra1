variable "region" {
  type = string
}

variable "amis" {
  type = map
  default = {
    "us-east-1" = "ami-04d29b6f966df1537"
    "us-west-1" = "ami-00831fc7c1e3ddc60"
  }
}

variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_access_key" {
  type = string
}

output "ami" {
  value = aws_instance.firstinstance.ami
}