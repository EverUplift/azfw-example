# rcg_internet_inbound.tf
resource "azurerm_firewall_policy_rule_collection_group" "internet_inbound_rule_collection_group" {
  name               = "rcg-internet-inbound"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 1200

  network_rule_collection {
    name     = "network-rules-internet-inbound"
    priority = 1000
    action   = "Allow"

    rule {
      name                  = "allow-external-api-dev"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.aks_external_dev.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-external-api-test"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.aks_external_test.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-external-api-prod"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.aks_external_prod.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-internal-api-dev"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.aks_internal_dev.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-internal-api-test"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.aks_internal_test.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-internal-api-prod"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.aks_internal_prod.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-avd-access"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.avd_testing.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-shared-services"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.shared_services.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-monitoring-agents"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.monitoring_agents.id]
      destination_ports     = ["443"]
    }

    rule {
      name                  = "allow-external-api-public"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ip_groups = [azurerm_ip_group.aks_external_prod.id]
      destination_ports     = ["80"]
    }
  }
}
/*
resource "azurerm_firewall_nat_rule_collection" "internet_inbound_nat_rule_collection" {
  name                = "internet-inbound-nat-rc"
  azure_firewall_name = "existing-firewall-name" # Replace with your firewall name
  resource_group_name = azurerm_resource_group.rg.name # Replace with your resource group name
  priority            = 200
  action              = "Dnat"

  rule {
    name                  = "dnat-web-server"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    destination_addresses = ["public-ip-address"] # Replace with your public IP address
    destination_ports     = ["80", "443"]
    translated_address    = "10.0.2.4" # Internal web server IP
    translated_port       = "80"
  }

  rule {
    name                  = "dnat-ssh-server"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    destination_addresses = ["public-ip-address"] # Replace with your public IP address
    destination_ports     = ["22"]
    translated_address    = "10.0.2.5" # Internal SSH server IP
    translated_port       = "22"
  }

  rule {
    name                  = "dnat-sql-server"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    destination_addresses = ["public-ip-address"] # Replace with your public IP address
    destination_ports     = ["1433"]
    translated_address    = "10.0.2.6" # Internal SQL server IP
    translated_port       = "1433"
  }

  rule {
    name                  = "dnat-ftp-server"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    destination_addresses = ["public-ip-address"] # Replace with your public IP address
    destination_ports     = ["21"]
    translated_address    = "10.0.2.7" # Internal FTP server IP
    translated_port       = "21"
  }

  rule {
    name                  = "dnat-rdp-server"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    destination_addresses = ["public-ip-address"] # Replace with your public IP address
    destination_ports     = ["3389"]
    translated_address    = "10.0.2.8" # Internal RDP server IP
    translated_port       = "3389"
  }
}
*/