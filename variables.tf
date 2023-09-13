variable "location" {
  type        = string
  description = "Azure Region name"
  default     = "westeurope"
}
variable "name" {
  type        = string
  description = "Generic name, enter your name to identify your resources"
  default = "miniku"
}

variable "aks_node_pool_config" {
  default = {
    default = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_D2_v2"
    }
  }
}

variable "tags" {
  type        = map(any)
  description = "Tags to identify resources in billing mostly"
  default     = {}
}