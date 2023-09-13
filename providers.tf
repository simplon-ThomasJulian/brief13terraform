terraform {

  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformsimplon"
    container_name       = "states"
    key                  = "networking"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
    helm = {
      source  = "hashicorp/helm"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
    config_path = ".kube/config"
  }

}