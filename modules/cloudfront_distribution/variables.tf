variable "cf_aliases" {
    type = list(string)
    default =[]
  }

  variable "cf_price_class" {
    type = string
    default = "PriceClass_100"
}

variable "cf_acm_certificate_arn" {
    type = string
    default = ""
}