variable "instance_type" {}
variable "public_subnet_id" {}
variable "private_subnet_id" {}

variable "frontend_sg" {}
variable "backend_sg" {}

variable "db_endpoint" {}

variable "key_name" {
  description = "Name of the key pair to use for SSH access to the EC2 instance."
  default = "boto3-key"
}
variable "ami" {
  description = "AMI ID for the EC2 instance."
   default = "ami-07216ac99dc46a187" # Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
}
