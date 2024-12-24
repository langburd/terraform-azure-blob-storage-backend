output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.terraform_azure_blob_storage_backend.resource_group_name
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = module.terraform_azure_blob_storage_backend.storage_account_name
}

output "storage_account_primary_access_key" {
  description = "The primary access key of the storage account."
  value       = module.terraform_azure_blob_storage_backend.storage_account_primary_access_key
  sensitive   = true
}

output "storage_account_secondary_access_key" {
  description = "The secondary access key of the storage account."
  value       = module.terraform_azure_blob_storage_backend.storage_account_secondary_access_key
  sensitive   = true
}

output "storage_container_name" {
  description = "The name of the storage container."
  value       = module.terraform_azure_blob_storage_backend.storage_container_name
}
