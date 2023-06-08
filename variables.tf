variable "aws_region" {
  default = "af-south-1"
}

variable "availability_zone" {
  default = "af-south-1a"
}

variable "vpc_cidr_prefices" {
  default = {
    dev  = "11.0"
    prod = "12.0"
    qa   = "13.0"
  }
}

variable "public_subnet_cidr_suffix" {
  default = "1.0/24"
}

variable "private_subnet_cidr_suffix" {
  default = "2.0/24"
}

variable "isolated_subnet_cidr_suffix" {
  default = "3.0/24"
}

locals {
  dev_vpc_cidr             = "${var.vpc_cidr_prefices["dev"]}.0.0/16"
  dev_public_subnet_cidr   = "${var.vpc_cidr_prefices["dev"]}.${var.public_subnet_cidr_suffix}"
  dev_private_subnet_cidr  = "${var.vpc_cidr_prefices["dev"]}.${var.private_subnet_cidr_suffix}"
  dev_isolated_subnet_cidr = "${var.vpc_cidr_prefices["dev"]}.${var.isolated_subnet_cidr_suffix}"

  prod_vpc_cidr             = "${var.vpc_cidr_prefices["prod"]}.0.0/16"
  prod_public_subnet_cidr   = "${var.vpc_cidr_prefices["prod"]}.${var.public_subnet_cidr_suffix}"
  prod_private_subnet_cidr  = "${var.vpc_cidr_prefices["prod"]}.${var.private_subnet_cidr_suffix}"
  prod_isolated_subnet_cidr = "${var.vpc_cidr_prefices["prod"]}.${var.isolated_subnet_cidr_suffix}"

  qa_vpc_cidr             = "${var.vpc_cidr_prefices["qa"]}.0.0/16"
  qa_public_subnet_cidr   = "${var.vpc_cidr_prefices["qa"]}.${var.public_subnet_cidr_suffix}"
  qa_private_subnet_cidr  = "${var.vpc_cidr_prefices["qa"]}.${var.private_subnet_cidr_suffix}"
  qa_isolated_subnet_cidr = "${var.vpc_cidr_prefices["qa"]}.${var.isolated_subnet_cidr_suffix}"
}