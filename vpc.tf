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
resource "aws_internet_gateway" "morlu-vpc-igw" {
    vpc_id = aws_vpc.morlu_vpc.id
    tags = {
      Name      = "morlu-vpc-internet gateway"
      
    }
  
}