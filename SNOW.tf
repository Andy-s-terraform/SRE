terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    }
    }


provider "aws" {
  region = "eu-west-2"
  access_key = "AKIAJPK6KBXLETUTOZ4Q"
  secret_key = "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"
}

resource "aws_instance" "my-first-server" {
  count = 1
  ami           = "ami-08698c6c1186276cc"
  instance_type = "t2.micro"
   tags = {
    Name = "Windows"
  
   }

}

resource "null_resource" "copy_execute" {

  connection {
    type     = "winrm"
    user     = "Administrator"
    password = "var.admin_password"
    host     = "var.host"
  }
   
 provisioner "file" {
    source      = "Install_7zip.sh"
    destination = "/C:/Windows/System32/"

  }

 provisioner "remote-exec" {
    inline    = [
    "sh /C:/Windows/System32/Install_7zip.sh"
    ]
  }

depends_on = [ aws_instance.my-first-server ]

}


resource "aws_vpc" "first_vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "production"
  }

}

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.first_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "prod-subnet"
  }
}
