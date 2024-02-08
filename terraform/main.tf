provider "aws" {
  region = "us-east-1"
  alias  = "east1"
}

resource "tls_private_key" "tomcat_keypair" {
  algorithm   = "RSA"
  rsa_bits    = 2048
}

resource "aws_key_pair" "tomcat_keypair" {
  provider    = aws.east1
  key_name    = "tomcat_keypair"
  public_key  = tls_private_key.tomcat_keypair.public_key_openssh
}

resource "aws_instance" "tomcat_instance" {
  provider        = aws.east1
  ami             = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
  instance_type   = "t2.small"
  key_name        = aws_key_pair.tomcat_keypair.key_name

  tags = {
    Name = "Tomcat Instance"
  }
}

output "public_ip" {
  value = aws_instance.tomcat_instance.public_ip
}
