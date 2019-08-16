terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  version = ">= 2.11"
  region  = var.region
}

provider "template" {
  version = "~> 2.1"
}

module "kms" {
  source  = "../.."
  project = "examples"
  env     = "demo"
  tags    = {
    Team = "Examples"
    Environment = "demo"
  }

  custom_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Allow root to manage the key",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                  "arn:aws:iam::999999999999:root",
                  "arn:aws:iam::111111111111:user/myuser"
                ]
            },
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
EOF

}
