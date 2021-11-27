resource "aws_s3_bucket" "S3" {
  bucket = "boma-bucket"
  acl    = "public-read-write"

  tags = {
    Name        = "boma-bucket"
    Env         = "dev"
    Managedwith = "terraform"
    Company     = "EliteSolutionsIT"
  }
}