locals {
  base_name              = trim(lower(format("%s-%s-%s", var.name, var.project, var.env)), "-")
  base_name_no_dashes    = replace(local.base_name, "-", "")
  resource_group_name    = var.resource_group_name != "" ? var.resource_group_name : substr(format("rg-%s", local.base_name), 0, 90)
  storage_account_name   = var.storage_account_name != "" ? var.storage_account_name : substr(format("st%s", local.base_name_no_dashes), 0, 24)
  storage_container_name = var.storage_container_name != "" ? var.storage_container_name : substr(format("stct-%s", local.base_name), 0, 63)
}

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.location
  tags = {
    Description = "Resource Group for Terraform States"
    Environment = title(var.env)
    Name        = local.resource_group_name
    Owner       = title(var.name)
  }
}

resource "azurerm_storage_account" "this" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    versioning_enabled = true
  }

  tags = {
    Description = "Storage Account for Terraform States"
    Environment = title(var.env)
    Name        = local.storage_account_name
    Owner       = title(var.name)
  }
}

resource "azurerm_storage_container" "this" {
  name               = local.storage_container_name
  storage_account_id = azurerm_storage_account.this.id
}
