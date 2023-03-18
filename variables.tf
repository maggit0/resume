variable "region" {
  description = "The AWS region"
  type        = string
  default = "us-east-2"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the Route53 record"
  type        = string
}

variable "zone_id" {
  description = "The ID of the Route53 hosted zone"
  type        = string
}

variable "ttl" {
  description = "The TTL for the Route53 record"
  type        = number
}
