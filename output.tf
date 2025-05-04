output "rg_name" {
  value = azurerm_resource_group.public.name
}

output "aks_name" {
  value = module.aks.name
}

output "connect_command" {
  value = "az aks get-credentials --resource-group ${azurerm_resource_group.public.name} --name ${module.aks.name} --subscription ${data.azurerm_client_config.current.subscription_id}"
}
