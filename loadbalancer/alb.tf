resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_alb.id]
  subnets            = [aws_subnet.main_public.id, aws_subnet.main_private.id]


  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.S3.bucket
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Name        = "aws-_alb"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}