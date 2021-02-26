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
  access_key = "Acces_Key"
  secret_key = "Secret_Key"
}

resource "aws_instance" "Server_Name" {
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
    source      = "Install_SNOW.sh"
    destination = "C:\Program Files"

  }

 provisioner "remote-exec" {
    inline    = [
    "sh C:/Program Files/Install_SNOW.sh"
    ]
  }

depends_on = [ aws_instance.Server_Name ]

}


resource "aws_vpc" "VPC_Name" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "production"
  }

}

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.VPC_Name.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "prod-subnet"
  }
}
