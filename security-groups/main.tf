variable "ec2_sg_name" {}
variable "vpc_id" {}
variable "ec2_jenkins_sg_name" {}

output "sg_ec2_sg_ssh_http_id" {
  value = aws_security_group.ec2_sg_ssh_http.id
}

output "sg_ec2_jenkins_port_8080" {
  value = aws_security_group.ec2_jenkins_port_8080.id
}

resource "aws_security_group" "ec2_sg_ssh_http" {
  name        = var.ec2_sg_name
  description = "Enable the Port 22(SSH) & Port 80(http)"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow remote SSH from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  # enable http
  ingress {
    description = "Allow HTTP request from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  # enable http
  ingress {
    description = "Allow HTTP request from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  #Outgoing request
  egress {
    description = "Allow outgoing request"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Groups to allow SSH(22) and HTTP(80)"
  }
}

resource "aws_security_group" "ec2_jenkins_port_8080" {
  name        = var.ec2_jenkins_sg_name
  description = "Enable the Port 8080 for jenkins"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow 8080 port to access jenkins"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
  }

  tags = {
    Name = "Security Groups to allow SSH(22) and HTTP(80)"
  }
}


# for one security group option.

# resource "aws_security_group" "web_server" {
#   name = "web-server-sg"
#   description = "Security group for web server instances"
#   vpc_id = aws_vpc.main.id

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]  # Replace with your specific source IP or CIDR block for SSH access

#     # Allow HTTP traffic on port 80 from anywhere
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]

#     # Allow HTTPS traffic on port 443 from anywhere
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]  # Allow outbound traffic to anywhere

#     # Alternatively, restrict outbound traffic to a specific port and IP range
#     # from_port = 443
#     # to_port = 443
#     # protocol = "tcp"
#     # cidr_blocks = ["10.0.0.0/16"]  # Example outbound traffic to a specific VPC subnet
#   }
# }

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"  # Replace with your desired VPC CIDR block
# }
