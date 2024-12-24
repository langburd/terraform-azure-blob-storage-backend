# Terraform Azure Blob Storage Backend Module

This Terraform module helps you to create and manage an Azure Blob Storage backend for storing Terraform state files. It ensures consistency in naming conventions and provides a structured way to manage resources.

## Prerequisites

1. Before using this module, ensure you have the following tools installed:

   - [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) - The Azure Command-Line Interface (CLI) is a set of commands used to create and manage Azure resources.
   - [jq](https://stedolan.github.io/jq/download/) - jq is a lightweight and flexible command-line JSON processor.

2. Login to Azure and choose the right subscription:

    ```bash
    az login && export ARM_SUBSCRIPTION_ID=$(az account show | jq -r .id)
    ```

## Usage

To use this module, include it in your Terraform configuration as shown below:

```hcl
module "terraform_azure_blob_storage_backend" {
  source = "../"

  # Required:
  location = "East US"

  # Option 1:
  # name    = "Company"
  # env     = "Dev"
  # project = "Project"

  # Option 2:
  # resource_group_name    = "my-rg-tfstates"
  # storage_account_name   = "myrgtfstates"
  # storage_container_name = "my-stct-tfstates"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | The environment for which the infrastructure is being created. | `string` | `"Dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which all resources will be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name to be used as a main part of the resource names. | `string` | `"Company"` | no |
| <a name="input_project"></a> [project](#input\_project) | The name of the project for which the infrastructure is being created. | `string` | `"Project"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of the resource group. | `string` | `""` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | (Optional) The name of the storage account. | `string` | `""` | no |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | (Optional) The name of the storage container. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the storage account. |
| <a name="output_storage_account_primary_access_key"></a> [storage\_account\_primary\_access\_key](#output\_storage\_account\_primary\_access\_key) | The primary access key of the storage account. |
| <a name="output_storage_account_secondary_access_key"></a> [storage\_account\_secondary\_access\_key](#output\_storage\_account\_secondary\_access\_key) | The secondary access key of the storage account. |
| <a name="output_storage_container_name"></a> [storage\_container\_name](#output\_storage\_container\_name) | The name of the storage container. |
<!-- END_TF_DOCS -->

## Example

```hcl
module "terraform_azure_blob_storage_backend" {
  source = "../"

  location = "East US"
  name     = "Company"
  project  = "Project"
  env      = "Dev"
}
```

## Advanced Usage

### Custom Resource Names

You can specify custom names for the resource group, storage account, and storage container:

```hcl
module "terraform_azure_blob_storage_backend" {
  source = "../"

  location                = "East US"
  resource_group_name     = "my-rg-tfstates"
  storage_account_name    = "myrgtfstates"
  storage_container_name  = "my-stct-tfstates"
}
```

## Contributing

Contributions are welcome! This project uses pre-commit hooks to ensure code quality. Please make sure to install and run pre-commit before submitting any changes.

## License

<a href="https://opensource.org/license/mit"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge" alt="MIT License"></a>

<details>
<summary>MIT License</summary>
<br/>
<br/>

Complete license is available in the [`LICENSE`](LICENSE) file.

```text
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

</details>

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## Copyrights

Copyright © 2024 [Avi Langburd](https://github.com/langburd)
