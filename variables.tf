variable "access_key" {
  description = "Access key to AWS console"
}

variable "secret_key" {
  description = "Secret key to AWS console"
}

variable "key_name" {
  default = "terraform-key"
}

variable "instance_name" {
  description = "Name of the instance to be created"
  default     = "demo-app"
}

variable "instance_type" {
  default = "t2.micro"
}

# variable "subnet_id" {
#   description = "The VPC subnet the instance(s) will be created in"
#   default     = "subnet-07ebbe60"
# }

variable "ami_id" {
  description = "The AMI to use"
  default     = "ami-0ff39345bd62c82a5"
}

variable "number_of_instances" {
  description = "number of instances to be created"
  default     = 1
}

