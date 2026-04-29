resource "aws_instance" "frontend" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.frontend_sg]
  key_name               = var.key_name

  user_data = file("C:\\Users\\prati\\Desktop\\Terraform\\3-tier-console\\modules\\ec2\\frontend.sh")

  tags = {
    Name = "frontend-ec2"
  }
}

resource "aws_instance" "backend" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.backend_sg]
  key_name               = var.key_name

  user_data = templatefile("C:\\Users\\prati\\Desktop\\Terraform\\3-tier-console\\modules\\ec2\\backend.sh", {
  db_endpoint = var.db_endpoint
})

  tags = {
    Name = "backend-ec2"
  }
}