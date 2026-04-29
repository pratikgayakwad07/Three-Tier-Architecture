## This module creates security groups for the 3-tier architecture. It includes security groups for the frontend, backend, and database layers. The security groups are configured to allow appropriate traffic between the layers while restricting access from external sources.
variable "vpc_id" {
    description = "The ID of the VPC where security groups will be created"
    type        = string

}

## This variable allows you to specify the CIDR block from which SSH access to the EC2 instances will be allowed. By default, it is set to "
variable "allowed_ssh_cidr" {
  default = "0.0.0.0/0"
}