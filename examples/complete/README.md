# IAM Role Complete Example

Configuration in this directory creates an IAM role using the module, a customer-managed IAM policy, and attaches managed policies.

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| aws | >= 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 6.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| iam_role | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| aws_iam_policy.app | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| role_arn | ARN of the created IAM role. |
| role_name | Name of the created IAM role |
<!-- END_TF_DOCS -->
