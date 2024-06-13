# main.tf

resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg_name.id
  location = var.resource_group_location
}

resource "azurerm_firewall_policy" "parent_policy" {
  name                     = "azfw-parent-policy"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = var.firewall_sku_tier
  threat_intelligence_mode = "Alert"
}

resource "azurerm_firewall_policy" "azfw_policy" {
  name                     = "azfw-northcentralus-policy"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = var.firewall_sku_tier
  threat_intelligence_mode = "Alert"
  base_policy_id           = azurerm_firewall_policy.parent_policy.id # Associate parent policy
}
