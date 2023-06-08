module "vpc_qa"{
  source = "terraform-aws-modules/vpc/aws"
  cidr = local.qa_vpc_cidr
  azs = [var.availability_zone]
  public_subnets = [local.qa_public_subnet_cidr]
  private_subnets = [local.qa_private_subnet_cidr]
  enable_nat_gateway = true
  name = "sn-vpc-qa"
}

resource "aws_subnet" "isolated_subnet_qa" {
  vpc_id            = module.vpc_qa.vpc_id
  cidr_block        = local.qa_isolated_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "${module.vpc_qa.name}-isolated-${var.availability_zone}"
  }
}

resource "aws_instance" "private_ec2_qa" {
  subnet_id = module.vpc_qa.private_subnets[0]
  instance_type = "t3.micro"
  ami = data.aws_ami.al2.id

  tags = {
    Name = "sn-qa-server"
  }
}