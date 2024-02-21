#  az account list-locations --query "[?not_null(metadata.latitude)] .{RegionName:name , RegionDisplayName:regionalDisplayName} " --output table
variable "resource_group_location" {
  type        = string
  default     = "southeastasia"
  description = "Location of the resource group."
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
  default     = "adminuser"
}
