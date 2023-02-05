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

  instances    = module.ec2_collection.instance_ips
  instance_ids = module.ec2_collection.instance_ids
  instance_sg  = module.ec2_collection.instance_sg
}

resource "null_resource" "write_ips_to_file" {
  triggers = {

    ips = module.ec2_collection.instance_ips[0]
  }

  provisioner "local-exec" {
    command = <<EOF


      echo "[webserver]" > ./host-inventory 

      clean_ips=$(echo $(terraform output mp_instance_ips) | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sed 's/"//g')

      for each_ip in $clean_ips; do
        echo $each_ip >> ./host-inventory
        
      done

    EOF
  }
}

# module "route53_subdomain" {
#   source = "./modules/route53"

#   elb_dns_name = module.mp_elb.dns_name
#   elb_zone_id = module.mp_elb.dns_zone_id
# }