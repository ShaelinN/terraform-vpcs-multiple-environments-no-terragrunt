module "vpc_prod"{
  source = "terraform-aws-modules/vpc/aws"
  cidr = local.prod_vpc_cidr
  azs = [var.availability_zone]
  public_subnets = [local.prod_public_subnet_cidr]
  private_subnets = [local.prod_private_subnet_cidr]
  enable_nat_gateway = true
  name = "sn-vpc-prod"
}

resource "aws_subnet" "isolated_subnet_prod" {
  vpc_id            = module.vpc_prod.vpc_id
  cidr_block        = local.prod_isolated_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "${module.vpc_prod.name}-isolated-${var.availability_zone}"
  }
}

resource "aws_instance" "private_ec2_prod" {
  subnet_id = module.vpc_prod.private_subnets[0]
  instance_type = "t3.micro"
  ami = data.aws_ami.al2.id

  tags = {
    Name = "sn-prod-server"
  }
}