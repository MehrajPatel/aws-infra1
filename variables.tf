variable "region" {
  type = string
}

variable "amis" {
  type = map
  default = {
    "us-east-1" = "ami-04d29b6f966df1537"
    "us-west-1" = "ami-08d9a394ac1c2994c"
  }
}

variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_access_key" {
  type      = string
  sensitive = true
}

output "ami" {
  value = aws_instance.firstinstance.ami
}