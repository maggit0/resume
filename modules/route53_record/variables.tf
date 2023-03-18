variable "zone_id" {
    description = "The ID of he Route53 hosted zone"
    type = string
}

variable "domain_name" {
    description = "The domain name for the Route53 record"
    type = string
}

variable "ttl" {
    description = "The TTL for the Route53 record"
    type = number
}