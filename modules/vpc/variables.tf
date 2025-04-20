variable "cidr_block" {
  description = "cidr block of vpc"
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "vpc name"
  type = string
  default = "My VPC"
}

variable "cidr_block_public_subnet_1" {
  description = "cidr block of public subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "availability zone"
  type = string
  default = "ap-southeast-1"
}

variable "public_subnet_name" {
  description = "public subnet name"
  type = string
  default = "public-subnet-1"
}

variable "cidr_block_private_subnet_1" {
  description = "cidr block of private subnet"
  type = string
  default = "10.0.4.0/24"
}

variable "private_subnet_name" {
  description = "private subnet name"
  type = string
  default = "private-subnet-1"
}

variable "igw_name" {
  description = "internet gateway name"
  type = string
  default = "main-igw"
}

variable "nat_gw_name" {
  description = "nat gateway name"
  type = string
  default = "main-nat-gw"
}

variable "cidr_public_rt" {
  default = "0.0.0.0/0"
}

variable "public_rt_name" {
  default = "public-route-tables"
}

variable "cidr_private_rt" {
  default = "0.0.0.0/0"
}

variable "private_rt_name" {
  default = "private-route-tables"
}
variable "web_sg" {
  default = "web_sg"
}