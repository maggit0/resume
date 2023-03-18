module "s3_bucket" {
  source = "github.com/maggit0/resume//modules/s3_bucket"
}
resource "aws_cloudfront_distribution" "resume_distribution" {
    depends_on = [module.s3_bucket]

    origin {
        domain_name = module.s3_bucket.bucket_name
        origin_id = module.s3_bucket.bucket_name

        s3_origin_config {
          origin_access_identity = aws_cloudfront_origin_access_identity.s3_access_identity.cloudfront_access_identity_path
        }
    }

    enabled = true
    is_ipv6_enabled = true
    comment = "Cloudfront distribution for my resume"
    default_root_object = "index.html"

    aliases = var.cf_aliases

    default_cache_behavior {
      allowed_methods = ["GET", "HEAD"]
      cached_methods = ["GET", "HEAD"]
      target_origin_id = module.s3_bucket.bucket_name
      
      forwarded_values {
        query_string = false
      
        cookies {
            forward = "none"
        }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
}

    price_class = var.cf_price_class

    restrictions {
        geo_restriction {
        restriction_type = "whitelist"
        locations = ["CN", "RU"]
    }
}

    viewer_certificate {
        acm_certificate_arn = var.cf_acm_certificate_arn
        ssl_support_method = "sni-only"
        minimum_protocol_version = "TLSv1.2_2019"
        certificate_source = "acm"
        cloudfront_default_certificate = false
}

    logging_config {
        bucket = aws_s3_bucket.log_bucket.bucket_domain_name
        include_cookies = false
        prefix = "access-logs/"
    }
}