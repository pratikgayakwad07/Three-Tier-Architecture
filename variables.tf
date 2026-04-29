variable "region" { 
    default = "ap-south-1" 
}

variable "instance_type" { 
    default = "t2.micro"
}

variable "db_username" {
    default = "admin"
}
variable "db_password" {
    default = "admin123"
}

variable "key_name" {
    default = "boto3-key"
}


