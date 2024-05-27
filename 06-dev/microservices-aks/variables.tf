variable "resource_group_name" {
  type        = string
  description = "The Name of the Resouce group"
}

variable "location" {
  type        = string
  description = "The Location of the Resouce Group & The Solution"
}



variable "prefix" {
  type        = string
  description = "The prefix of every resouce name in the solution"
}

variable "tags" {
  type        = map(string)
  description = "The Tags of every resource in the solution"
}

variable "virtual_network_name" {
  description = "This is the Vnet Name"
  type        = string
}



variable "dns_servers" {
  description = "This is the DNS Servers that The Vnet Will use for DNS Resolution"
  type        = list(string)

}

variable "address_space" {
  description = "This is the DNS Servers that The Vnet Will use for DNS Resolution"
  type        = list(string)
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
  description = "A map of subnets to create"
}


####AKS #####
variable "aks_cluster_name" {
  description = "The name of the AKS Cluster"
  type        = string
}

variable "aks_cluster_location" {
  description = "The location of the AKS"
  type        = string
}



variable "dns_prefix_private_cluster" {
  description = "The DNS prefix of the AKS"
  type        = string
}

variable "kubernetes_version" {
  description = "Select the AKS version"
  type        = string
}

variable "default_node_pool_name" {
  description = "The Default node pool with the System Pods"
  type        = string
}
variable "default_aks_node_pool_vnet_subnet_id" {
  type = string
}
variable "default_node_pool_vm_size" {
  description = "The Default node pool VM Size"
  type        = string
}

variable "default_node_pool_type" {
  description = "Type of the agent pool (AvailabilitySet and VirtualMachineScaleSets)"
  type        = string
  default     = "VirtualMachineScaleSets"
}

variable "os_disk_size_gb" {
  description = "Size of the OS disk to attach to the nodes"
  type        = number
}

variable "os_sku" {
  description = "The OS system of the nodes in the default node pool"
  type        = string
}



variable "max_pods" {
  description = "Maximum number of pods that can run on a single node"
  type        = number
}

variable "zones" {
  description = "The Zones that the nodes will be deployed on"
  type        = list(string)
}

variable "network_plugin" {
  description = "Network plugin to use for networking [kubenet or azure]"
  type        = string
}


variable "azure_kubernetes_cluster_node_pools" {
  description = "A map of AKS node pools to create"
  type = map(object({
    vm_size             = string
    zones               = list(string)
    os_disk_size_gb     = number
    os_sku              = string
    azure_aks_node_pool_vnet_subnet_id      = string
    max_pods            = number
    mode                = string
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
    node_count          = number
    max_surge           = string
  }))
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
}


