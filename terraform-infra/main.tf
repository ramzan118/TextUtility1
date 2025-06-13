terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~>1.0"
    }
  }
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


# Define the Azure Databricks Workspace
resource "azurerm_resource_group" "databricks_rg" {
  name     = "Test_resource_group"
  location = "East US"
}

resource "azurerm_databricks_workspace" "databricks_ws" {
  name                = "DataBricksWorkspace"
  location            = azurerm_resource_group.databricks_rg.location
  resource_group_name = azurerm_resource_group.databricks_rg.name
  sku                 = "standard"
}

#provider "databricks" {
#  host = azurerm_databricks_workspace.databricks_ws.workspace_url
#}
