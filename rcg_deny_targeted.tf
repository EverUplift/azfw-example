# rcg_deny_targeted.tf
resource "azurerm_firewall_policy_rule_collection_group" "targeted_deny_rule_collection_group" {
  name               = "rcg-deny-targeted"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 1700

  network_rule_collection {
    name     = "network-rules-deny-targeted"
    priority = 1000
    action   = "Deny"

    rule {
      name                  = "deny-dmz-web-prod"
      protocols             = ["Any"]
      source_addresses      = ["10.0.10.0/24"]  # DMZ subnet 1
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }

    rule {
      name                  = "deny-dmz-web-test"
      protocols             = ["Any"]
      source_addresses      = ["10.0.20.0/24"]  # DMZ subnet 2
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }

    rule {
      name                  = "deny-aks-external"
      protocols             = ["Any"]
      source_addresses      = ["10.0.30.0/24"]  # External AKS cluster subnet
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }

    rule {
      name                  = "deny-external-service"
      protocols             = ["Any"]
      source_addresses      = ["10.0.40.0/24"]  # Another external service subnet
      destination_addresses = ["*"]
      destination_ports     = ["*"]
    }
  }
}
