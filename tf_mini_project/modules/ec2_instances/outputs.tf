output "instance_ids" {
    description = ""
    value = "${aws_instance.mini-proj-instances.*.id}"
}

output "instance_ips" {
    description = ""
    value = "${aws_instance.mini-proj-instances.*.public_ip}"
}

output "instance_sg" {
    value = "${aws_instance.mini-proj-instances[0].vpc_security_group_ids}"
}