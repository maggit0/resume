resource "aws_route53_record" "resume" {
    zone_id = var.zone_id
    name = var.domain_name
    type = "A"
    ttl = var.ttl

    alias {
      name = module.cloudfront_distribution.distribution_domain_name
      zone_id = module.cloudfront_distribution.distribution_hosted_zone_id
      evaluate_target_health = false
    }
  
}