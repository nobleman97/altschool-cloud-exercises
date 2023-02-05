output "dns_name" {
    value = "${aws_lb.mp_alb.dns_name}"
}

output "dns_zone_id" {
    value = "${aws_lb.mp_alb.zone_id}"
}