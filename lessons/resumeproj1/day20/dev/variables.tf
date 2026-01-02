variable "rgname" {
  type        = string
  description = "resource group name"

}

variable "location" {
  type    = string
  default = "canadacentral"
}



variable "keyvault_name" {
  type = string
}

variable "SUB_ID" {
  type = string
}

variable "client_id" {
  description = "Service Principal client ID (appId)"
  type        = string
}

variable "client_secret" {
  description = "Service Principal client secret"
  type        = string
  sensitive   = true
}