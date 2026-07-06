resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
  tags = {
    Name        = "${var.project_name}-${var.environment}-s3-bucket"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "move_to_glacier" {
  bucket = aws_s3_bucket.main.id
  rule {
    id = "rule-1"
    filter {}
    transition {
      days          = 30
      storage_class = "GLACIER"
    }
    status = "Enabled"
  }
}