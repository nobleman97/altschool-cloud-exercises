



resource "aws_route53_record" "subdomain" {
  zone_id = aws_route53_zone.my_domain.zone_id
  name    = "terraform-test.${var.domain_name}"
  type    = "AAAA"

  alias {
    name                   = var.elb_dns_name
    zone_id               = var.elb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_zone" "my_domain" {
  name = var.domain_name
}