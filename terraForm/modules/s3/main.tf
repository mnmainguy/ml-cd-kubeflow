resource "aws_s3_bucket" "aiops-s3" {
  bucket = "aiops-${lower(var.aiops_env)}"
  tags = {
    name = "aiops bucket"
    environment = "training"
  }
}