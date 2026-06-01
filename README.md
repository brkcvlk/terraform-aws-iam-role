# AWS IAM Role Terraform module

Terraform module which creates an AWS IAM role with a trust policy and attaches managed policies by ARN.

## Usage

```hcl
module "iam_role" {
  source  = "brkcvlk/iam-role/aws"
  version = "1.0.0"

  name        = "my-app-role"
  description = "Role for my-app"

  principals = {
    ec2 = {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }

  policies = {
    ssm = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
```

## Examples

- [complete](examples/complete) - IAM role with service and cross-account principals, managed and custom policies

## Releases

See [CHANGELOG.md](CHANGELOG.md). Pin a version with a [Git tag](https://github.com/brkcvlk/terraform-aws-iam-role/tags).

## License

MIT. See [LICENSE](LICENSE).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| aws | >= 6.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the IAM role. | `string` | n/a | yes |
| description | Description of the IAM role. | `string` | `""` | no |
| principals | Map of principals allowed to assume this role. Each entry creates one trust policy statement. Valid types: `Service`, `AWS`, `Federated`, `CanonicalUser`. | `map(object({ type = string, identifiers = list(string) }))` | n/a | yes |
| policies | Map of managed policy ARNs to attach to the role. | `map(string)` | `{}` | no |
| tags | Tags to assign to the IAM role. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the IAM role. |
| name | Name of the IAM role. |
<!-- END_TF_DOCS -->
