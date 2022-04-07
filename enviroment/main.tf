data "azurerm_resource_group" "terraboot" {
  name = "terrabootlabs"
}

resource "azurerm_management_lock" "rglock" {
  name       = "resource-group-level"
  scope      = data.azurerm_resource_group.terrabootlabs.id
  lock_level = "ReadOnly"
  notes      = "This Resource Group is Read-Only"
}
data "azurerm_subnet" "terrabootlabs1" {
  name                 = "terrabootlabs1"
  virtual_network_name = "terrabootlabs"
  resource_group_name  = "terrabootlabs"
}

resource "azurerm_lb" "loadbalancer" {

  name                = var.name
  resource_group_name = data.azurerm_resource_group.terrabootlabs.id
  location            = var.location
  sku                 = var.sku
  sku_tier            = var.sku_tier
  frontend_ip_configuration {
    name = var.ip_name
    // availability_zone                                  = var.ip_availability_zone
    subnet_id                                          = data.azurerm_subnet.terrabootlabs1.id
    gateway_load_balancer_frontend_ip_configuration_id = var.id_gateway_load_balancer_frontend_ip_configuration_id
    private_ip_address_allocation                      = var.ip_private_ip_address_allocation
    private_ip_address_version                         = var.ip_private_ip_address_version
  }

}