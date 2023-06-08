terraform {
 backend "s3" {
    bucket = "nshaelin-terraform-state"
    key = "terraform.tfstate"
    region = "af-south-1"
  }
}

provider "aws" {
  region = var.aws_region
  /*default_tags {
    Creator = "nshaelin"
    Environment = terraform.workspace.name
  }*/
  profile = "nshaelin"
}

data "aws_ami" "al2" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}