resource "aws_instance" "Ubuntu" {

  ami                    = "ami-036d46416a34a611c"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.class-key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = aws_subnet.main_public.id
  tags = {
    Name        = "Ec2-terra"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}
