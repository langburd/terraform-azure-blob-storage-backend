output "resource_group_name" {
  value = "${azurerm_resource_group.terraform_rg.name}"
}

output "storage_account_name" {
  value = "${azurerm_storage_account.terraform_storage_account.name}"
}

output "container_name" {
  value = "${azurerm_storage_container.terraform_storage_container.name}"
}
