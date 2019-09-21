
# You can not use variables in this block, all values should be "hard-coded"
terraform {
  backend "azurerm" {
    resource_group_name  = "Customer-Terraform-States-RG" # output of the command 'terraform output resource_group_name'
    storage_account_name = "customertfaccount"            # output of the command 'terraform output storage_account_name'
    container_name       = "customer-tfstates"            # output of the command 'terraform output container_name'
    key                  = "customer/project.tfstate"     # path to the state file - change according to the project - customer/project.tfstate
  }
}
