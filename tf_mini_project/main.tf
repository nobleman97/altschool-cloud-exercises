terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {

  region                   = "us-west-2"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "myAdmin"
}

# # Create a VPC
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }

module "ec2_collection" {
  source = "./modules/ec2_instances"
  #   version = "4.3.0"
}

module "mp_elb" {
  source = "./modules/elb"

  instances = module.ec2_collection.instance_ips
  instance_ids = module.ec2_collection.instance_ids
}