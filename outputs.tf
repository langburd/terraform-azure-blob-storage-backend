output "backend_snippet" {
  description = "The backend configuration snippet for Terraform."
  value       = <<EOF
terraform {
  backend "azurerm" {
    resource_group_name   = "${azurerm_resource_group.this.name}"
    storage_account_name  = "${azurerm_storage_account.this.name}"
    container_name        = "${azurerm_storage_container.this.name}"
    key                   = "${lower(var.env)}/${lower(var.project)}/terraform.tfstate"
  }
}
EOF
}

output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.this.name
}

output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.this.name
}

output "storage_account_primary_access_key" {
  description = "The primary access key of the storage account."
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
}

output "storage_account_secondary_access_key" {
  description = "The secondary access key of the storage account."
  value       = azurerm_storage_account.this.secondary_access_key
  sensitive   = true
}

output "storage_container_name" {
  description = "The name of the storage container."
  value       = azurerm_storage_container.this.name
}
