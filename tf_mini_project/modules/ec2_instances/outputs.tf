output "instance_ids" {
    description = ""
    value = "${aws_instance.mini-proj-instances.*.id}"
}

output "instance_ips" {
    description = ""
    value = "${aws_instance.mini-proj-instances.*.public_ip}"
}