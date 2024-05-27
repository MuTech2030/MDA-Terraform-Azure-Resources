######################################################################################################################################################
#                                   Create the Backend and the Statefile
######################################################################################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.89.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "muDigitalTransformation"
    storage_account_name = "mudigitaltransformation"
    container_name       = "azuredigital-dev"
    key                  = "azuredigital-dev-microservices-aks.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

######################################################################################################################################################
#                                   locals values for naming & common values
######################################################################################################################################################
locals {
  location = var.location
  prefix   = var.prefix
}

######################################################################################################################################################
#                                   Create Resource Group
######################################################################################################################################################

module "microservices-aks-rg" {
  source   = "../../00-modules/resource-group"
  name     = var.resource_group_name
  location = local.location
  tags     = var.tags
}

######################################################################################################################################################
#                                   Create Vnet & Subnets 
######################################################################################################################################################

module "microservices-aks-Vnet" {
  source              = "../../00-modules/Vnet"
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = module.microservices-aks-rg.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
  subnets             = var.subnets
}


######################################################################################################################################################
#                                   Create AKS Cluster & Default Node Pool & Node Pools & ACR  
######################################################################################################################################################

module "aks_cluster" {
  source = "../../00-modules/aks" # Adjust this path to your module's location

  name                                = var.aks_cluster_name
  location                            = var.aks_cluster_location
  resource_group_name                 = var.resource_group_name
  dns_prefix_private_cluster          = var.dns_prefix_private_cluster
  kubernetes_version                  = var.kubernetes_version
  default_node_pool_name              = var.default_node_pool_name
  default_node_pool_vm_size           = var.default_node_pool_vm_size
  default_node_pool_type              = var.default_node_pool_type
  os_disk_size_gb                     = var.os_disk_size_gb
  os_sku                              = var.os_sku
  default_aks_node_pool_vnet_subnet_id = var.default_aks_node_pool_vnet_subnet_id
  max_pods                            = var.max_pods
  zones                               = var.zones
  network_plugin                      = var.network_plugin
  azure_kubernetes_cluster_node_pools = var.azure_kubernetes_cluster_node_pools


  acr_name                            = var.acr_name
  sku                                 = var.sku
  tags                                = var.tags
  }
