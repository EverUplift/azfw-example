# rcg_internet_outbound.tf
resource "azurerm_firewall_policy_rule_collection_group" "internet_outbound_rule_collection_group" {
  name               = "rcg-internet-outbound"
  firewall_policy_id = azurerm_firewall_policy.azfw_policy.id
  priority           = 1300

  network_rule_collection {
    name     = "network-rules-internet-outbound"
    priority = 1000
    action   = "Allow"

    rule {
      name                  = "allow-smtp-outbound"
      protocols             = ["TCP"]
      source_ip_groups      = [
        azurerm_ip_group.aks_internal_dev.id,
        azurerm_ip_group.aks_internal_test.id,
        azurerm_ip_group.aks_internal_prod.id,
        azurerm_ip_group.shared_services.id
      ]
      destination_addresses = ["*"]
      destination_ports     = ["587", "465"]
    }

    rule {
      name                  = "allow-dns-udp"
      protocols             = ["UDP"]
      source_ip_groups      = [
        azurerm_ip_group.aks_internal_dev.id,
        azurerm_ip_group.aks_internal_test.id,
        azurerm_ip_group.aks_internal_prod.id,
        azurerm_ip_group.shared_services.id
      ]
      destination_addresses = ["*"]
      destination_ports     = ["53"]
    }

    rule {
      name                  = "allow-ntp"
      protocols             = ["UDP"]
      source_ip_groups      = [
        azurerm_ip_group.aks_internal_dev.id,
        azurerm_ip_group.aks_internal_test.id,
        azurerm_ip_group.aks_internal_prod.id,
        azurerm_ip_group.shared_services.id
      ]
      destination_addresses = ["*"]
      destination_ports     = ["123"]
    }

    rule {
      name                  = "allow-ftp"
      protocols             = ["TCP"]
      source_ip_groups      = [
        azurerm_ip_group.aks_internal_dev.id,
        azurerm_ip_group.aks_internal_test.id,
        azurerm_ip_group.aks_internal_prod.id,
        azurerm_ip_group.shared_services.id
      ]
      destination_addresses = ["*"]
      destination_ports     = ["21"]
    }

    rule {
      name                  = "allow-ssh-outbound"
      protocols             = ["TCP"]
      source_ip_groups      = [
        azurerm_ip_group.aks_internal_dev.id,
        azurerm_ip_group.aks_internal_test.id,
        azurerm_ip_group.aks_internal_prod.id,
        azurerm_ip_group.shared_services.id
      ]
      destination_addresses = ["*"]
      destination_ports     = ["22"]
    }
  }

application_rule_collection {
    name     = "application-rules-internet-outbound"
    priority = 1100
    action   = "Allow"

    rule {
      name             = "allow-web-browsing"
      source_addresses = ["10.0.0.0/16"]
      protocols {
        type = "Http"
        port = 80
      }
      protocols {
        type = "Https"
        port = 443
      }
      destination_fqdns = ["*"]
    }

    rule {
      name             = "allow-office365"
      source_addresses = ["10.0.0.0/16"]
      protocols {
        type = "Https"
        port = 443
      }
      destination_fqdns = ["*.office365.com"]
    }

    rule {
      name             = "allow-github"
      source_addresses = ["10.0.0.0/16"]
      protocols {
        type = "Https"
        port = 443
      }
      destination_fqdns = ["*.github.com"]
    }

    rule {
      name             = "allow-docker-registry"
      source_addresses = ["10.0.0.0/16"]
      protocols {
        type = "Https"
        port = 443
      }
      destination_fqdns = ["*.docker.com"]
    }

    rule {
      name             = "allow-windows-update"
      source_addresses = ["10.0.0.0/16"]
      protocols {
        type = "Https"
        port = 443
      }
      destination_fqdns = ["*.windowsupdate.com"]
    }
  }
}
