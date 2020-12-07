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

variable "TF_VAR_aws_access_key_id" {
  type = string
}

variable "TF_VAR_aws_secret_access_key" {
  type      = string
}

output "ami" {
  value = aws_instance.firstinstance.ami
}