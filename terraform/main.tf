provider "azurerm" { }

terraform {
  backend "azurerm" {
  }
}

### Création des SM de base ###

resource "random_integer" "ri" {
    min = 10000
    max = 99999
}

resource "azurerm_storage_account" "anteraz" {
  name                     = "anteraz${var.env}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.resource_group_location}"
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "anteraz" {
  name                = "anteraz-${var.env}"
  location            = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group_name}"
  kind                = "FunctionApp"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_cosmosdb_account" "anteraz" {
    name                = "anteraz-${var.env}-${random_integer.ri.result}"
    location            = "${var.resource_group_location}"
    resource_group_name = "${var.resource_group_name}"
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"


    enable_automatic_failover = true

    consistency_policy {
        consistency_level       = "BoundedStaleness"
        max_interval_in_seconds = 10
        max_staleness_prefix    = 200
    }

    geo_location {
        location          = "${var.resource_group_location}"
        failover_priority = 0
    }
}

resource "azurerm_app_service" "anteraz" {
  name = "anteraz-${var.env}"
  location = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group_name}"
  app_service_plan_id = "${azurerm_app_service_plan.anteraz.id}"
}

resource "azurerm_function_app" "anteraz" {
  name                      = "anteraz-${var.env}-${random_integer.ri.result}"
  location                  = "${var.resource_group_location}"
  resource_group_name       = "${var.resource_group_name}"
  app_service_plan_id       = "${azurerm_app_service_plan.anteraz.id}"
  storage_connection_string = "${azurerm_storage_account.anteraz.primary_connection_string }"
  version                   = "${var.func_version}"
  app_settings              = "${var.app_settings}"
}
