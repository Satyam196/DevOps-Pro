provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "web" {
    ami = "ami-09a6bd44f658d0bbc"
    instance_type = "t3.micro"

    count = 4

    tags = {
        name = "HelloWorld"
    }
}