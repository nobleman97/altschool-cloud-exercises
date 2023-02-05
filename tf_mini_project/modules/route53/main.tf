resource "aws_route53_record" "subdomain" {
  zone_id = aws_route53_zone.nobleman.zone_id
  name    = "terraform-test.nobleman.me"
  type    = "A"

  alias {
    name                   = var.elb_dns_name
    zone_id               = var.elb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_zone" "nobleman" {
  name = "nobleman.me"
}