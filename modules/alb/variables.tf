variable "tags" {
  type = map
}

variable "resource_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "alb_subnets" {
  type = list
}
variable "cert_arn" {
  type = string
}

variable "domain" {
  type = string
}

variable "zone_id" {
  type = string
}

variable "alb_sg_ids" {
  type = list(string)
}
