variable "aws_region" {
  default = "af-south-1"
}

provider "aws" {
  region = var.aws_region

  profile = "nshaelin"
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "nshaelin-terraform-state"
}