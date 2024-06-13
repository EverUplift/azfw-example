# rcg_allow_az_any_any.tf
resource "azurerm_firewall_policy_rule_collection_group" "allow_all_azure_networks_rule_collection_group" {
  name               = "rcg-allow-all-azure-networks"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 1800

  network_rule_collection {
    name     = "network-rules-allow-all-azure-networks"
    priority = 1000
    action   = "Allow"

    rule {
      name                  = "allow-azure-subnet"
      protocols             = ["Any"]
      source_addresses      = ["10.0.0.0/16"]  # Replace with your Azure /16 subnet
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
  }
}
