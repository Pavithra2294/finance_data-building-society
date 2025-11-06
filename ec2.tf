
resource "aws_security_group" "demo-vpc-sg1" {
  name        = "demo-vpc-sg1"
  description = "demo-vpc-sg1"
  vpc_id      = aws_vpc.demo-vpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "demo-sg"
  }

}

resource "aws_instance" "ubuntu" {
  ami             = "ami-01fd6fa49060e89a6"
  instance_type   = "t3.micro"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]

  tags = {
    Name = "HelloWorld"
  }

}