resource "aws_iam_role" "this" {
  name               = var.name
  description        = var.description
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = var.tags
}

data "aws_iam_policy_document" "assume_role" {
  dynamic "statement" {
    for_each = var.principals
    content {
      actions = ["sts:AssumeRole"]
      principals {
        type        = statement.value.type
        identifiers = statement.value.identifiers
      }
    }
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.policies

  role       = aws_iam_role.this.name
  policy_arn = each.value
}
