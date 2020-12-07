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
resource "aws_instance" "firstinstance" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
}
