variable "env" {
  default     = "Dev"
  description = "The environment for which the infrastructure is being created."
  type        = string
}

variable "location" {
  description = "The Azure Region in which all resources will be created."
  type        = string
}

variable "name" {
  default     = "Company"
  description = "The name to be used as a main part of the resource names."
  type        = string
}

variable "project" {
  default     = "Project"
  description = "The name of the project for which the infrastructure is being created."
  type        = string
}

variable "resource_group_name" {
  default     = ""
  description = "(Optional) The name of the resource group."
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9-]*$", var.resource_group_name))
    error_message = "The resource group name should contain only lowercase letters, digits or dashes."
  }
}

variable "storage_account_name" {
  default     = ""
  description = "(Optional) The name of the storage account."
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9]*$", var.storage_account_name))
    error_message = "The storage account name should contain only lowercase letters or digits."
  }
}

variable "storage_container_name" {
  default     = ""
  description = "(Optional) The name of the storage container."
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9-]*$", var.storage_container_name))
    error_message = "The storage container name should contain only lowercase letters, digits or dashes."
  }
}
