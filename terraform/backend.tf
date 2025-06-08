terraform {
  backend "azurerm" {
    resource_group_name   = "Test_resource_group"
    storage_account_name  = "teststorage11981749"
    container_name        = "terraform-state-blob-dev"
    key                  = "terraform.tfstate"
  }
}
