
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.cidr_block_public_subnet_1
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.main.id

  cidr_block = var.cidr_block_private_subnet_1
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_subnet_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.igw_name
  }
}

#==============NAT-GATEWAY======================#
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet_1.id
  tags = {
    Name = var.nat_gw_name
  }
}

# ROUTE TABLES
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_public_rt
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route_table_association" "public_rt_asso" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_private_rt
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = var.private_rt_name
  }
}

resource "aws_security_group" "web_sg" {
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Cho phép HTTP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Cho phép mọi outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.web_sg
  }
}
