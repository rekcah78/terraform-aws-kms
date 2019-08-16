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
}
