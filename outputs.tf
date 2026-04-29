
output "alb_url" {
  value = module.alb.alb_dns_name
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "frontend_ip" {
  value = module.ec2.frontend_public_ip
}