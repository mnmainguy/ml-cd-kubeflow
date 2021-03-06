resource "aws_s3_bucket" "aiops-s3" {
  bucket = "aiops-${lower(var.aiops_env)}"
  acl    = "public-read-write"
  tags = {
    name = "aiops bucket"
    environment = "training"
  }
  policy = <<POLICY
{
 "Version": "2012-10-17",
 "Statement": [
                {
                    "Sid": "PublicReadGetObject",
                    "Effect": "Allow",
                    "Principal": "*",
                    "Action": "s3:GetObject",
                    "Resource": "arn:aws:s3:::aiops-${lower(var.aiops_env)}/*"
                }
              ]
}
POLICY
}

resource "aws_s3_bucket" "aiops-s3-prod" {
  bucket = "aiops-prod"
  acl    = "public-read-write"
  tags = {
    name = "aiops bucket"
    environment = "training"
  }
  policy = <<POLICY
{
 "Version": "2012-10-17",
 "Statement": [
                {
                    "Sid": "PublicReadGetObject",
                    "Effect": "Allow",
                    "Principal": "*",
                    "Action": "s3:GetObject",
                    "Resource": "arn:aws:s3:::aiops-prod/*"
                }
              ]
}
POLICY
}

resource "aws_s3_bucket" "aiops-s3-backup" {
  bucket = "aiops-backup"
  acl    = "public-read-write"
  tags = {
    name = "aiops bucket"
    environment = "training"
  }
  policy = <<POLICY
{
 "Version": "2012-10-17",
 "Statement": [
                {
                    "Sid": "PublicReadGetObject",
                    "Effect": "Allow",
                    "Principal": "*",
                    "Action": "s3:GetObject",
                    "Resource": "arn:aws:s3:::aiops-backup/*"
                }
              ]
}
POLICY
}