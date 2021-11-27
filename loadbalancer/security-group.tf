#SECURITY GROUP

resource "aws_security_group" "allow_alb" {
  name        = "allow_alb"
  description = "Allow alb inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "alb from VPC"
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
    Name        = "ALB-security-group"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}