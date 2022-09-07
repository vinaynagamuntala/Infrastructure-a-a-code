resource "aws_security_group" "apache" {
  name        = "allow_users"
  description = "Allow users inbound traffic"
  vpc_id      = aws_vpc.stage-vpc.id

  ingress {
    description      = "enduser"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb.id]
  }
 ingress {
    description      = "admin"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.bastion.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "stage-apache-sg"
    terraform = "true"
  }
}

# creating intance

resource "aws_instance" "apache" {
  ami           = "ami-0b89f7b3f054b957e"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private[0].id
  vpc_security_group_ids = [aws_security_group.apache.id]

  tags = {
    Name = "stage-apache"
    terraaform = "true"
  }
}