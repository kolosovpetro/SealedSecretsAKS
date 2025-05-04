data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "public" {
  location = var.location
  name     = "${var.resource_group_name}-${var.prefix}"
  tags     = var.tags
}

module "aks" {
  source                      = "github.com/kolosovpetro/AzureAKSTerraform.git//modules/aks?ref=master"
  aks_name                    = "aks-${var.prefix}"
  default_node_pool_type      = "VirtualMachineScaleSets"
  default_node_pool_vm_size   = "Standard_DS2_v2"
  kubernetes_version          = "1.31.2"
  resource_group_location     = azurerm_resource_group.public.location
  resource_group_name         = azurerm_resource_group.public.name
  system_node_count           = 3
  should_deploy_log_analytics = false
}
