output "key_stack_arn" {
  description = "The KMS Key arn"
  value       = "${aws_kms_key.default.arn}"
}

output "key_stack_id" {
  description = "The KMS Key ID"
  value       = "${aws_kms_key.default.key_id}"
}

output "key_alias_arn" {
  description = "The KMS Key Alias arn"
  value       = "${aws_kms_alias.default.arn}"
}