module "cloudfront_distribution" {
  source = "git::https://github.com/maggit0/resume.git//modules/cloudfront_distribution"
  depends_on = [module.s3_bucket]
}

module "s3_bucket" {
  source = "git::https://github.com/maggit0/resume.git//modules/s3_bucket"
  bucket_name = var.bucket_name
}

module "route53_record" {
  source = "git::https://github.com/maggit0/resume.git//modules/route53_record"
  domain_name = var.domain_name
  zone_id = var.zone_id
  ttl = var.ttl
  depends_on = [module.cloudfront_distribution]
}
