module "s3_bucket" {
  source = "git::https://github.com/maggit0/resume.git//modules/s3_bucket"
  bucket_name = var.bucket_name
}

module "cloudfront_distribution" {
  source = "git::https://github.com/maggit0/resume.git//modules/cloudfront_distribution"
  bucket_name = module.s3_bucket.bucket_id
}

module "route53_record" {
  source = "git::https://github.com/maggit0/resume.git//modules/route53_record"
  domain_name = var.domain_name
  cloudfront_url = module.cloudfront_distribution.distribution_domain_name
}