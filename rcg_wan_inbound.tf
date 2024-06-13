# rcg_wan_inbound.tf
resource "azurerm_firewall_policy_rule_collection_group" "wan_inbound_rule_collection_group" {
  name               = "rcg-wan-inbound"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 1500

  network_rule_collection {
    name     = "network-rules-wan-inbound"
    priority = 1000
    action   = "Allow"
    

    rule {
      name                  = "allow-on-prem-to-internal-dev"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.aks_internal_dev.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-on-prem-to-internal-test"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.aks_internal_test.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-on-prem-to-internal-prod"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.aks_internal_prod.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-on-prem-to-external-dev"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.aks_external_dev.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-on-prem-to-external-test"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.aks_external_test.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-on-prem-to-external-prod"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.aks_external_prod.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-on-prem-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["445"]
    }

    rule {
      name                  = "allow-on-prem-to-avd"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.avd_testing.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-on-prem-to-monitoring"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.monitoring_agents.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-on-prem-to-sql"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.on_prem_networks.id]
      destination_ip_groups = [azurerm_ip_group.aks_internal_prod.id]
      destination_ports     = ["1433"]
    }
  }
}
