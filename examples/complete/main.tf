provider "aws" {
  region = "eu-central-1"
}

module "iam_role" {
  source = "../.."

  name        = "my-app-role"
  description = "Role for my-app EC2 instances"

  principals = {
    ec2 = {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    cross_account = {
      type        = "AWS"
      identifiers = ["arn:aws:iam::123456789012:role/deployer"]
    }
  }

  policies = {
    ssm    = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    s3     = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    custom = aws_iam_policy.app.arn
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_policy" "app" {
  name = "my-app-custom-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["secretsmanager:GetSecretValue"]
      Resource = "arn:aws:secretsmanager:eu-central-1:123456789012:secret:my-app/*"
    }]
  })
}
