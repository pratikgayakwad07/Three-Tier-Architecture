variable "vpc_id" {}

variable "public_subnets" {
  type = list(string)
}

variable "alb_sg" {}

variable "frontend_instance_id" {
  type = string
}
