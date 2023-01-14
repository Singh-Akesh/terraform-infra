provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-east-2"
}

resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

resource "aws_security_group" "allow-all-tcp" {
  name        = "allow-all-tcp"
  description = "Allow All TCP from anywhere"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  count         = var.number_of_instances
  instance_type = var.instance_type
  key_name      = aws_key_pair.generated_key.key_name
  security_groups = [
    "${aws_security_group.allow-all-tcp.name}"
  ]
  tags = {
    Name = var.instance_name
  }
}
