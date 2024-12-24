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
