resource_group_name  = "dev_microservices_aksrg"
location = "West US 2"
prefix   = "microservices_aks"
tags = {
  "Environment"   = "dev"
  "Project"       = "microservices_aks"
  "Business Unit" = "Smart Services"
  "Owner"         = "mudt"
  "Terraform"     = "1"
}

virtual_network_name = "dev_microservices_aks_vnet"
address_space        = ["10.0.0.0/16"]
dns_servers          = ["10.0.0.7", "10.0.0.8"]

subnets = {
  "dev_microservices_aks_subnet-blob-storage" = {
    address_prefixes = ["10.0.1.0/24"]
  },
  "dev_microservices_aks_subnet-aks-node-pool" = {
    address_prefixes = ["10.0.2.0/24"]
  },
  "dev_microservices_aks_subnet-aks" = {
    address_prefixes = ["10.0.3.0/24"]
  },
  "dev_microservices_aks_subnet-rds" = {
    address_prefixes = ["10.0.4.0/24"]
  },
  "dev_microservices_aks_subnet-lb" = {
    address_prefixes = ["10.0.5.0/24"]
  },
    "dev_microservices_aks_subnet-redis" = {
    address_prefixes = ["10.0.6.0/24"]
  }
}


### aks values ###
aks_cluster_name = "example-aks-cluster"
aks_cluster_location = "West US 2"
dns_prefix_private_cluster = "exampleaksdns"
kubernetes_version = "1.28.5"
default_node_pool_name = "systempool"
default_node_pool_vm_size = "Standard_d2plds_v5"
default_node_pool_type = "VirtualMachineScaleSets"
default_aks_node_pool_vnet_subnet_id = "/subscriptions/0d6d231d-90b9-432f-8485-2ae6da0d8306/resourceGroups/dev_microservices_aksrg/providers/Microsoft.Network/virtualNetworks/dev_microservices_aks_vnet/subnets/dev_microservices_aks_subnet-aks"
os_disk_size_gb = 30
os_sku = "Ubuntu"
max_pods = 30
zones = ["1", "2", "3"]
network_plugin = "kubenet"


azure_kubernetes_cluster_node_pools = {
  nodepool1 = {
    vm_size = "Standard_d2plds_v5"
    zones = ["1"]
    os_disk_size_gb = 30
    os_sku = "Ubuntu"
    max_pods = 30
    mode = "User"
    enable_auto_scaling = true
    azure_aks_node_pool_vnet_subnet_id = "/subscriptions/0d6d231d-90b9-432f-8485-2ae6da0d8306/resourceGroups/dev_microservices_aksrg/providers/Microsoft.Network/virtualNetworks/dev_microservices_aks_vnet/subnets/dev_microservices_aks_subnet-aks-node-pool"
    min_count = 0
    max_count = 3
    node_count = 0
    max_surge = "25%"
  }
}

acr_name = "aksdevOpsaedevnew"
sku = "Premium"

