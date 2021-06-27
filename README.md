# Create Azure Blob Storage backend for your Terraform Azure project

## Prerequisites

- AZ CLI is installed. See [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).
- AZ CLI is configured. Run:

```bash
az login
az account list --output table
az account set --subscription <SubscriptionId>
```

## Create configuration

Change `variables.tf` with your info.

Run `terraform init`

Run `terraform apply`

The name of the resource group you can check with the command `terraform output resource_group_name`

The name of the storage account name you can check with the command `terraform output storage_account_name`

The name of the container name you can check with the command `terraform output container_name`

Add the file `example\backend.tf` to your project and edit as needed.

## Repository of the project

[terraform-azure-blob-storage-backend](https://github.com/langburd/terraform-azure-blob-storage-backend)

## Authors

- [@langburd](https://www.github.com/langburd)
