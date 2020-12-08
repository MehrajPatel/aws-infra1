variable "region" {
  type = string
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "Learn"
}

variable "amis" {
  type = map
  default = {
    "us-east-1" = "ami-04d29b6f966df1537"
    "us-west-1" = "ami-0a741b782c2c8632d"
  }
}

variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_access_key" {
  type      = string
}

output "ami" {
  value = aws_instance.firstinstance.ami
}

