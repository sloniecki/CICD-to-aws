resource "aws_route53_zone" "private" {
  name = "local.com"

  vpc {
    vpc_id = aws_vpc.main.id
  }
}

resource "aws_route53_record" "db" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "db.local.com"
  type    = "CNAME"
  ttl     = 300
  records = [aws_db_instance.database.address]
}


resource "aws_route53_record" "regional" {
  zone_id = aws_route53_zone.private.zone_id

  name = "ilb.local.com"
  type = "A"

  alias {
    name                   = aws_alb.inter-lb-app.dns_name
    zone_id                = aws_alb.inter-lb-app.zone_id
    evaluate_target_health = true
  }
}