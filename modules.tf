data "azurerm_resource_group" "terraboot" {
  name = "terrabootlabs"
}

data "azurerm_subnet" "terrabootlabs1" {
  name                 = "terrabootlabs1"
  virtual_network_name = "terrabootlabs"
  resource_group_name  = "terrabootlabs"
}

module "lbmodule" {

  source = "./enviroment"

  name                                                  = var.name
  location                                              = var.location
  resource_group_name                                   = data.azurerm_resource_group.terraboot.id
  sku                                                   = var.sku
  sku_tier                                              = var.sku_tier
  ip_subnet_id                                          = data.azurerm_subnet.terrabootlabs1.id
  id_gateway_load_balancer_frontend_ip_configuration_id = var.id_gateway_load_balancer_frontend_ip_configuration_id
  ip_name                                               = var.ip_name
}