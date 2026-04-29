variable "db_name" {
  default = "blogdb"
}

variable "db_username" {
    default = "admin"
}
variable "db_password" {
    default = "admin123"
}

variable "private_subnets" {
  type = list(string)
}

variable "rds_sg" {
    type = string
}