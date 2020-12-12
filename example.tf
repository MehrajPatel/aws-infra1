terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "mehrajpatel"

    workspaces {
      name = "aws-infra1"
    }
  }
}
provider "aws" {
  profile    = "default"
  region     = var.region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

# resource "aws_vpc" "vpc" {
#   cidr_block           = var.cidr_vpc
#   enable_dns_support   = true
#   enable_dns_hostnames = true
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.vpc.id
# }

# resource "aws_subnet" "subnet_public" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = var.cidr_subnet
# }

# resource "aws_route_table" "rtb_public" {
#   vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }

# resource "aws_route_table_association" "rta_subnet_public" {
#   subnet_id      = aws_subnet.subnet_public.id
#   route_table_id = aws_route_table.rtb_public.id
# }

# resource "aws_security_group" "sg_22_80" {
#   name   = "sg_22"
#   vpc_id = aws_vpc.vpc.id

#   # SSH access from the VPC
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# data "template_file" "user_data" {
#   template = file("./scripts/add-ssh-web-app.yaml")
# }

# resource "aws_instance" "web" {
#   ami                         = var.amis[var.region]
#   instance_type               = "t2.micro"
#   subnet_id                   = aws_subnet.subnet_public.id
#   vpc_security_group_ids      = [aws_security_group.sg_22_80.id]
#   associate_public_ip_address = true
#   user_data                   = data.template_file.user_data.rendered

#   tags = {
#     Name = "Learn-CloudInit"
#   }
# }

# output "public_ip" {
#   value = aws_instance.web.public_ip
# }

#-------------------------------- RDS -------------------------------#


resource "aws_db_subnet_group" "dbsub" {
  count      = 2
  name       = "main-${count.index + 1}"
  subnet_ids = ["subnet-2d627d76", "subnet-b2d417d4"]
}

resource "aws_db_instance" "db1" {
  count                    = 2
  name                     = "db2"
  identifier               = "database1"
  instance_class           = "db.t2.micro"
  allocated_storage        = 20
  engine                   = "mysql"
  engine_version           = "5.7"
  username                 = "patel"
  password                 = "Patel@123"
  skip_final_snapshot      = true
  aws_db_subnet_group_name = aws_db_subnet_group.dbsub[count.index].id
}