output "instance_ids" {
  description = ""
  value       = module.ec2_collection.instance_ids
}

output "mp_instance_ips" {
  value = module.ec2_collection.instance_ips
}

output "alb_dns-name" {
    value = module.mp_elb.dns_name
}