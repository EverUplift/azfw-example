variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
  default     = "northcentralus"
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix for the Resource Group Name that's combined with a random id so name is unique in your Azure subcription."
  default     = "rg"
}

variable "firewall_sku_tier" {
  type        = string
  description = "Firewall SKU."
  default     = "Standard" # Valid values are Basic, Standard, and Premium
  validation {
    condition     = contains(["Basic","Standard", "Premium"], var.firewall_sku_tier)
    error_message = "The SKU must be one of the following: Basic, Standard, or Premium"
  }
}