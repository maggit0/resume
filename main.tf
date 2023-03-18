module "s3_bucket" {
  source = ".modules/s3_bucket"
  bucket_name = var.bucket_name
}

module "cloudfront_distribution" {
  source = ".modules/cloudfront_distribution"
  domain_name = var.domain_name
  bucket_name = module.s3_bucket.bucket_id
}

module "route53_record" {
  source = "./modules/route53_record"
  domain_name = var.domain_name
  cloudfront_url = module.cloudfront_distribution.distribution_domain_name
}