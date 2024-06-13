# ip_groups.tf
resource "azurerm_ip_group" "aks_internal_dev" {
  name                = "aks-internal-dev-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.1.0/24"]
}

resource "azurerm_ip_group" "aks_internal_test" {
  name                = "aks-internal-test-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.2.0/24"]
}

resource "azurerm_ip_group" "aks_internal_prod" {
  name                = "aks-internal-prod-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.3.0/24"]
}

resource "azurerm_ip_group" "aks_external_dev" {
  name                = "aks-external-dev-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.4.0/24"]
}

resource "azurerm_ip_group" "aks_external_test" {
  name                = "aks-external-test-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.5.0/24"]
}

resource "azurerm_ip_group" "aks_external_prod" {
  name                = "aks-external-prod-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.6.0/24"]
}

resource "azurerm_ip_group" "shared_services" {
  name                = "shared-services-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.7.0/24"]
}

resource "azurerm_ip_group" "avd_testing" {
  name                = "avd-testing-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.8.0/24"]
}

resource "azurerm_ip_group" "monitoring_agents" {
  name                = "monitoring-agents-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.9.0/24"]
}

resource "azurerm_ip_group" "on_prem_networks" {
  name                = "on-prem-networks-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["192.168.1.0/24", "192.168.2.0/24"]
}

resource "azurerm_ip_group" "external_entities" {
  name                = "external-entities-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["0.0.0.0/0"]
}

resource "azurerm_ip_group" "security_agents" {
  name                = "security-agents-ip-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  cidrs               = ["10.0.99.0/24"]
}