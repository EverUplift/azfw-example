resource "azurerm_firewall_policy_rule_collection_group" "parent_rule_collection_group" {
  name               = "rcg-parent-base"
  firewall_policy_id = azurerm_firewall_policy.parent_policy.id
  priority           = 1000

  network_rule_collection {
    name     = "network-rules-parent-allow"
    priority = 1000
    action   = "Allow"

    rule {
      name                  = "allow-dns-to-az-private-resolver"
      protocols             = ["UDP", "TCP"]
      source_addresses      = ["*"]
      destination_addresses = ["10.0.8.4"] # Example IP for Azure DNS Resolver, replace with actual IP
      destination_ports     = ["53"]
    }
  }
}
