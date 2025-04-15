terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "509a9c2e-65df-4027-a4f4-d6b5da914bbe"
}

resource "azurerm_resource_group" "portfolio_rg" {
  name     = "rg-cloud-portfolio"
  location = "West Europe"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

resource "azurerm_static_web_app" "portfolio" {
  name                = "ismael-portfolio"
  location            = azurerm_resource_group.portfolio_rg.location
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  sku_tier            = "Free"
  sku_size            = "Free"


}
