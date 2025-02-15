terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Is for an static page, do not for a flask application, kubernetes is prefered
locals {
  mime_types = {
    "html" : "text/html"
    "css"  : "text/css"
    "js"   : "application/javascript"
    "json" : "application/json"
    "txt"  : "text/plain"
    "pdf"  : "application/pdf"
    "eot"  : "application/vnd.ms-fontobject"
    "gif"  : "image/gif"
    "htm"  : "text/html"
    "jpg"  : "image/jpeg"
    "png"  : "image/png"
    "svg"  : "image/svg+xml"
    "tif"  : "image/tiff"
    "ttf"  : "font/ttf"
    "woff" : "font/woff"
  }
}

provider "aws" {
  region = "us-west-1"
}

variable "website_domain_name" {
  description = "The domain name of the website"
  default = "mytestsite.io"
}

resource "random_string" "bucket_name_prefix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "robotics-page" {
  bucket = "${random_string.bucket_name_prefix.result}-${var.website_domain_name}"
}

resource "aws_s3_bucket_ownership_controls" "robotics-page" {
  bucket = aws_s3_bucket.robotics-page.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "robotics-page" {
  bucket = aws_s3_bucket.robotics-page.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_object" "robotics-page" {
  depends_on = [
    aws_s3_bucket_public_access_block.robotics-page,
    aws_s3_bucket_ownership_controls.robotics-page
  ]
  for_each     = fileset("/Robotics-web", "**/*")
  bucket       = aws_s3_bucket.robotics-page.id
  key          = each.value
  source       = "/Robotics-web/${each.value}"
  etag         = filemd5("/Robotics-web/${each.value}")
  acl          = "public-read"
  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1], "text/plain")
}

resource "aws_s3_bucket_website_configuration" "robotics-page" {
  depends_on = [
    aws_s3_bucket.robotics-page,
    aws_s3_object.robotics-page
  ]
  bucket = aws_s3_bucket.robotics-page.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "Methods-page.html"
  }
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.robotics-page.website_endpoint
}