locals {
  resource_group_name = "az104-rg3"

  tags = {
    Environment = "Production"
    CostCenter  = "000"
    Owner       = "MDTP"
    Service     = "SCOLP"
  }
}

data "azurerm_resource_group" "rg3" {
  name = "${local.resource_group_name}"
}


resource "azurerm_storage_account" "storageaccount" {
  name = "az104rg3storageacct"
  resource_group_name      = data.azurerm_resource_group.rg3.name
  location                 = data.azurerm_resource_group.rg3.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = "${local.tags["Environment"]}"
    CostCenter  = "${local.tags["CostCenter"]}"
    Owner       = "${local.tags["Owner"]}"
    Service     = "${local.tags["Service"]}"
  }
}