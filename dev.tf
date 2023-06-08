module "vpc_dev" {
  source = "terraform-aws-modules/vpc/aws"
  cidr = local.dev_vpc_cidr
  azs = [var.availability_zone]
  public_subnets = [local.dev_public_subnet_cidr]
  private_subnets = [local.dev_private_subnet_cidr]
  enable_nat_gateway = true
  name = "sn-vpc-dev"
}

resource "aws_subnet" "isolated_subnet_dev" {
  vpc_id            = module.vpc_dev.vpc_id
  cidr_block        = local.dev_isolated_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "${module.vpc_dev.name}-isolated-${var.availability_zone}"
  }
}

resource "aws_instance" "private_ec2_dev" {
  subnet_id = module.vpc_dev.private_subnets[0]
  instance_type = "t3.micro"
  ami = data.aws_ami.al2.id

  tags = {
    Name = "sn-dev-server"
  }
}