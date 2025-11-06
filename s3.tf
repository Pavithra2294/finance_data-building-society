resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-terraform-demo-bucket22"

  tags = {
    Name        = "my-terraform-demo-bucket22"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}