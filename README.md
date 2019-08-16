# terraform-aws-kms

A terraform module to create a managed KMS Customer Master Key (CMK) and its alias.. Available
through the [Terraform registry](https://registry.terraform.io/modules/rekcah78/kms/aws).

| Branch | Build status                                                                                                                            |
| ------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| master | [![build Status](https://travis-ci.org/rekcah78/terraform-aws-kms.svg?branch=master)](https://travis-ci.org/rekcah78/terraform-aws-kms) |

## Usage example

A full examples leveraging is contained in the [examples/
 directory](https://github.com/rekcah78/terraform-aws-kms/tree/master/examples/).

Here's the gist of using it via the Terraform registry:

```hcl
module "kms" {
  source  = "rekcah78/kms/aws"
  project = "examples"
  env     = "demo"
  tags    = {
    Team = "Examples"
    Environment = "demo"
  }
}
```

## Authors

Created and maintained by [Christophe Gasmi](https://github.com/rekcah78) - rekcah78@gmail.com.

## License

MIT Licensed. See [LICENSE](https://github.com/rekcah78/terraform-aws-kms/tree/master/LICENSE) for full details.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| custom_policy | Custom IAM Policy to override the default policy | string | `""` | no |
| deletion_window_in_days | Delay before finale deleting, Must be between 7 and 30 days | string | `"30"` | no |
| enable_key_rotation | Specifies whether key rotation is enabled | bool | `"false"` | no |
| env | Name of the env (e.g. `prod`, `dev`, `staging`) | string | n/a | yes |
| project | Name of the project | string | n/a | yes |
| stack | Name of the KMS instance | string | `"kms"` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`MyTeam`) | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_alias\_arn | The KMS Key Alias arn |
| key\_stack\_arn | The KMS Key arn |
| key\_stack\_id | The KMS Key ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
