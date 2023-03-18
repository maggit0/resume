resource "aws_s3_bucket" "resume_bucket" {
    bucket = var.bucket_name
}    
resource "aws_s3_bucket_acl" "resume_bucket_acl" {
    bucket = var.bucket_name   
    acl = "public-read"
    versioning {
      enabled = true
    }
    tags = {
        name = "resume_bucket"
    }
    region = var.region
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
    bucket = aws_s3_bucket.resume_bucket.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

output "s3_bucket_id" {
    value = aws_s3_bucket.resume_bucket.id
}

output "s3_bucket_arn" {
    value = aws_s3_bucket.resume_bucket.arn
}

output "s3_bucket_region" {
    value = aws_s3_bucket.resume_bucket.region
}