# Define VPC Variable

variable "aws-vpc-cidr" {
    type = string
    default = "10.0.0.0/16"
  
}

# Create VPC

resource "aws_vpc" "morlu_vpc" {
    cidr_block = var.aws-vpc-cidr
    instance_tenancy = "default"
    tags = {
      Name      = "morlu_vpc"
      Terraform = "True"
    }
  
}
# Create Internet-Gateway

resource "aws_internet_gateway" "morlu-vpc-igw" {
    vpc_id = aws_vpc.morlu_vpc.id
    tags = {
      Name      = "morlu-vpc-internet gateway"
      
    }
  
}

# Create Public-Subnets

resource "aws_subnet" "public-morlu-SN-1a" {
    vpc_id = aws_vpc.morlu_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = "true"
    tags = {
      Name = "public-morlu-SN-1a"
    }
  
}

resource "aws_subnet" "public-morlu-SN-1b" {
    vpc_id = aws_vpc.morlu_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = "true"
    tags = {
      Name = "public-morlu-SN-1b"
    }
  
}

# Create private-Subnets

resource "aws_subnet" "private-morlu-SN-1c" {
    vpc_id = aws_vpc.morlu_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1d"
    map_public_ip_on_launch = "false"
    tags = {
      Name = "private-morlu-SN-1c"
    }
  
}

resource "aws_subnet" "private-morlu-SN-1d" {
    vpc_id = aws_vpc.morlu_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-1d"
    map_public_ip_on_launch = "false"
    tags = {
      Name = "private-morlu-SN-1d"
    }
  
}

