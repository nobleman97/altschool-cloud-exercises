resource "aws_route53_record" "subdomain" {
  zone_id = aws_route53_zone.nobleman.zone_id
  name    = "terraform-test.nobleman.me"
  type    = "A"

  alias {
    name                   = aws_lb.example.dns_name
    zone_id               = aws_lb.example.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_zone" "nobleman" {
  name = "nobleman.me"
}