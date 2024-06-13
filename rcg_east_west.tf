# rcg_east_west.tf
resource "azurerm_firewall_policy_rule_collection_group" "east_west_rule_collection_group" {
  name               = "rcg-east-west"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 1400

  network_rule_collection {
    name     = "network-rules-east-west"
    priority = 1000
    action   = "Allow"

    rule {
      name                  = "allow-internal-dev-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_dev.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-internal-test-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_test.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-internal-prod-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_prod.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-external-dev-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_external_dev.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-external-test-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_external_test.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-external-prod-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_external_prod.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-avd-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.avd_testing.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-monitoring-to-shared-services"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.monitoring_agents.id]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-internal-dev-to-test"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_dev.id]
      destination_ip_groups = [azurerm_ip_group.aks_internal_test.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-internal-dev-to-prod"
      protocols             = ["TCP"]
      source_ip_groups      = [azurerm_ip_group.aks_internal_dev.id]
      destination_ip_groups = [azurerm_ip_group.aks_internal_prod.id]
      destination_ports     = ["443"]
    }
  }
}
