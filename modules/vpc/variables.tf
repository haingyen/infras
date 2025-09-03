variable "vpc_name" {
  description = "name of vpc"
  type = string
}

variable "vpc_cidr" {
  description = "cidr block of vpc"
  type = string
}

variable "public_subnet_cidrs" {
  description = "cidr block of public subnet"
  type = list(string)
}

variable "private_subnet_cidrs" {
  description = "cidr block of private subnet"
  type = list(string)
}
variable "availability_zones" {
  description = "availability zones"
  type = list(string) 
}

variable "env" {
  description = "The environment for the VPC"
  type        = string
}