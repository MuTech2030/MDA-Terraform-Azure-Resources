
output "resource_group_name" {
  value = module.microservices-aks-rg.resource_group_name
}

output "vnet_id" {
  value = module.microservices-aks-Vnet.vnet_id
}



output "subnet_details" {
  value = module.microservices-aks-Vnet.subnet_details
}