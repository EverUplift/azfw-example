# rcg_wan_outbound.tf
resource "azurerm_firewall_policy_rule_collection_group" "wan_outbound_rule_collection_group" {
  name               = "rcg-wan-outbound"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 1600

  network_rule_collection {
    name     = "network-rules-wan-outbound"
    priority = 1000
    action   = "Allow"

    rule {
      name                  = "allow-internal-dev-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_dev.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["445"]
    }

    rule {
      name                  = "allow-internal-test-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_test.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["445"]
    }

    rule {
      name                  = "allow-internal-prod-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_prod.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["445"]
    }

    rule {
      name                  = "allow-external-dev-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_external_dev.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-external-test-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_external_test.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-external-prod-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_external_prod.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-shared-services-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.shared_services.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["1433"]
    }

    rule {
      name                  = "allow-avd-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.avd_testing.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-monitoring-to-on-prem"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.monitoring_agents.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-internal-prod-to-on-prem-sql"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_prod.id]
      destination_ip_groups = [azurerm_ip_group.on_prem_networks.id]
      destination_ports     = ["1433"]
    }
  }
}
