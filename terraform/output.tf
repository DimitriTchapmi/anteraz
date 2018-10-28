
output "cosmosdb_id" {
  value = "${azurerm_cosmosdb_account.anteraz.id}"
}

output "cosmosdb_endpoint" {
  value = "${azurerm_cosmosdb_account.anteraz.endpoint}"
}

output "cosmos_primary_key" {
  value = "${azurerm_cosmosdb_account.anteraz.primary_master_key}"
}

output "cosmosdb_name" {
  value = "${azurerm_cosmosdb_account.anteraz.name}"
}

output "storage_connection_string" {
  value = "${azurerm_storage_account.anteraz.primary_connection_string}"
}

output "app_service_plan_id" {
  value = "${azurerm_app_service_plan.anteraz.id}"
}

output "storage_service_name" {
  value = "${azurerm_storage_account.anteraz.name}"
}

output "function_app_id" {
  value = "${azurerm_function_app.anteraz.id }"
}
