provider "azurerm" {
  features {}
subscription_id = "d57be264-8d8c-4e2f-abcb-82b085d61845"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-k8s-demo"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-demo-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aksdemo"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}
