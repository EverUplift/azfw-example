resource "azurerm_firewall_policy_rule_collection_group" "deny_all_rule_collection_group" {
  name               = "rcg-deny-all"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 2000

  network_rule_collection {
    name     = "network-rules-deny-all"
    priority = 1000
    action   = "Deny"

    rule {
      name                  = "deny-any-any"
      protocols             = ["Any"]
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
  }
}
