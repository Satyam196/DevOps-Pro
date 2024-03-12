provider "aws" {
    region = "eu-north-1"
}

# Create your VPC
resource "aws_vpc" "ironman" {
    cidr_block = "10.0.0.0/16"
    tags = {
        "name" = "ironman"
    }
}

# Create a public subnet
resource "aws_subnet" "PublicSubnet" {
    vpc_id = aws_vpc.ironman.id
    availability_zone = "eu-north-1a"
    cidr_block = "10.0.1.0/24"
}

# Create a private subnet
resource "aws_subnet" "PrivateSubnet" {
    vpc_id = aws_vpc.ironman.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
}

# Create a Internet gateway
resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.ironman.id
}

# route tables for public subnets
resource "aws_route_table" "PublicRT" {
    vpc_id = aws_vpc.ironman.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myigw.id
    }
}

# route table association with public subnets
resource "aws_route_table_association" "PublicRouteTableAssociation" {
    subnet_id = aws_subnet.PublicSubnet.id
    route_table_id = aws_route_table.PublicRT.id
}



