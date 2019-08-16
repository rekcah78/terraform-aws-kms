variable "project" {
  type        = string
  description = "Name of the project"
}

variable "env" {
  type        = string
  description = "Name of the env (e.g. `prod`, `dev`, `staging`)"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (e.g. map(`BusinessUnit`,`MyTeam`)"
  default     = {}
}

variable "stack" {
  type        = string
  description = "Name of the KMS instance"
  default     = "kms"
}

variable "custom_policy" {
  type        = string
  description = "Custom IAM Policy to override the default policy"
  default     = ""
}

variable "deletion_window_in_days" {
  type        = string
  description = "Delay before finale deleting, Must be between 7 and 30 days"
  default     = "30"
}

variable "enable_key_rotation" {
  type        = bool
  description = "Specifies whether key rotation is enabled"
  default     = false
}

# Locals
locals {
  name = "${var.project}-${var.env}-${var.stack}"

  stack_tags = {
    Name      = "${local.name}"
    Component = "kms"
  }

  tags = "${merge(var.tags, local.stack_tags)}"
}
