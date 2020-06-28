resource "azurerm_resource_group" "terraform_rg" {
  name     = join("-", [title(var.customer), "Terraform-States-RG"])
  location = var.location
  tags = {
    Description = "Resource Group for Terraform States"
    Owner       = title(var.customer)
    Environment = var.env
  }
}

resource "azurerm_storage_account" "terraform_storage_account" {
  name                     = lower("${var.customer}tfacc")
  resource_group_name      = azurerm_resource_group.terraform_rg.name
  location                 = azurerm_resource_group.terraform_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Description = "Storage Account for Terraform States"
    Owner       = title(var.customer)
    Environment = var.env
  }
}

resource "azurerm_storage_container" "terraform_storage_container" {
  name                  = lower("${var.customer}-tfstates")
  storage_account_name  = azurerm_storage_account.terraform_storage_account.name
  container_access_type = "container"
}
