terraform {
  required_version = ">= 0.12"
}

data "aws_caller_identity" "current" {}


data "aws_iam_policy_document" "default" {
  statement {
    sid    = "Allow root to manage the key"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
}


resource "aws_kms_key" "default" {
  description = local.name
  tags        = local.tags
  policy      = var.custom_policy != "" ? var.custom_policy : data.aws_iam_policy_document.default.json

  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
}

resource "aws_kms_alias" "default" {
  name          = "alias/${local.name}"
  target_key_id = aws_kms_key.default.key_id
}
