variable "resource_group_location" {
  type    = "string"
  default = "westeurope"
}

variable "resource_group_name" {
  type    = "string"
  default = ""
}

variable "env" {
  type    = "string"
  default = ""
}

variable "storage_access_key" {
  type    = "string"
  default = "***"
}

variable "func_version" {
  description = "The runtime version associated with the Function App. Possible values are `~1` and `beta`"
  default     = "~1"
}

variable "app_settings" {
  type        = "map"
  description = "A key-value pair of App Settings"
  default     = {
    APPINSIGHTS_INSTRUMENTATIONKEY = "key"
    FUNCTION_APP_EDIT_MODE         = "readwrite"
    WEBSITE_NODE_DEFAULT_VERSION   = "6.5.0"
  }
}
