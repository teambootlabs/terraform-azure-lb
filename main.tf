resource "azurerm_resource_group" "azure_rsg" {
  name     = "resource-group"
  location = var.location
}

resource "azurerm_management_lock" "rglock" {
  name       = "resource-group-level"
  scope      = azurerm_resource_group.azure_rsg.id
  lock_level = "ReadOnly"
  notes      = "This Resource Group is Read-Only"
}

resource "azurerm_lb" "loadbalancer" {

  name                = var.name
  resource_group_name = azurerm_resource_group.azure_rsg.id
  location            = var.location
  sku                 = var.sku
  sku_tier            = var.sku_tier
  frontend_ip_configuration {
    name                                               = var.ip_name
    availability_zone                                  = var.ip_availability_zone
    subnet_id                                          = var.ip_subnet_id
    gateway_load_balancer_frontend_ip_configuration_id = var.id_gateway_load_balancer_frontend_ip_configuration_id
    private_ip_address_allocation                      = var.ip_private_ip_address_allocation
    private_ip_address_version                         = var.ip_private_ip_address_version
  }

}