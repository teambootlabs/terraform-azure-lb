resource "azurerm_lb" "lodebalancer" {

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.region
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