module "network" {
  source = "git@github.com:simplon-ThomasJulian/brief13terraformmodule.git"

  location      = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = format("%s-%s", var.name, terraform.workspace)
  location            = module.network.resource_group.location
  resource_group_name = module.network.resource_group.name
  dns_prefix          = format("%s-%s", var.name, terraform.workspace)

  default_node_pool {
    name       = var.aks_node_pool_config.default.name
    node_count = var.aks_node_pool_config.default.node_count
    vm_size    = var.aks_node_pool_config.default.vm_size
    vnet_subnet_id = module.network.subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "local_file" "kube_config" {
  content  = azurerm_kubernetes_cluster.aks.kube_config_raw
  filename = ".kube/config"
}
