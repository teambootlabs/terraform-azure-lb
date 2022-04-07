//  required
variable "name" {
  description = " Specifies the name of the Load Balancer."
  type        = string
}



variable "resource_group_name" {
  description = "The name of the Resource Group in which to create the Load Balancer."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure Region where the Load Balancer should be created."
  type        = string
}

variable "ip_name" {
  description = " Specifies the name of the frontend ip configuration."
  type        = string
}

variable "ip_subnet_id" {
  description = "The ID of the Subnet which should be associated with the IP Configuration."
  type        = string
}

variable "id_gateway_load_balancer_frontend_ip_configuration_id" {
  description = "The Frontend IP Configuration ID of a Gateway Sku Load Balancer."
  type        = string
}
//   optional
variable "ip_private_ip_address_allocation" {
  description = "The allocation method for the Private IP Address used by this Load Balancer. "
  type        = string
  default     = "Dynamic"
}

variable "ip_private_ip_address_version" {
  description = "he version of IP that the Private IP Address is."
  type        = string
  default     = "IPv4"
}

variable "sku" {
  description = "The SKU of the Azure Load Balancer."
  type        = string
  default     = "Basic"
}

variable "sku_tier" {
  description = " The Sku Tier of this Load Balancer. Possible values are Global and Regional"
  type        = string
  default     = "Regional"
}

variable "ip_availability_zone" {
  description = " A list of Availability Zones which the Load Balancer's IP Addresses should be created in."
  type        = string
  default     = "Zone-Redundant"
}