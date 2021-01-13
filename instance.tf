resource "aws_security_group" "bwaap_sg" {
  description = "SG to access BWAAP instance in WAAP VPC in private subnet"
  vpc_id      = var.vpc

  # Open NodePort 7070 on AWS Linux instance to access BWAAP Docker container
  # BWAAP container is installed via instance user-data script

  ingress {
    from_port   = 7070
    to_port     = 7070
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["24.200.180.8/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "BWAAP-SG"
  }

}


resource "aws_instance" "bwaap_instance" {
  ami                         = "ami-0a0ad6b70e61be944"
  instance_type               = "t2.nano"
  availability_zone           = "us-east-2a"
  subnet_id                   = var.public_subnet 
  key_name                    = var.key_name
  associate_public_ip_address = "true"
  private_ip                  = "10.120.10.10"
  vpc_security_group_ids      = [aws_security_group.bwaap_sg.id]
  user_data                   = <<-EOF
                                #! bin/bash
                                sudo yum update -y
                                sudo yum install docker -y
                                sudo service docker start 
                                sudo usermod -a -G docker ec2-user
                                docker ps 
                                sudo su -
                                logout
                                docker run -d -p 7070:80 raesene/bwapp
                                EOF

  tags = {
    Name = "BWAAP Linux"
  }
}