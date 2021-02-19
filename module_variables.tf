variable "saname" {
    type = string
    description = "Name of storage account"
}

variable "rgname" {
    type = string
    description = "Name of resource group"
}

variable "location" {
    type = string
    description = "Azure location of storage account environment"
    default = "westeurope"
}

// variable "storage_account_object" {
//     description = "Storage Account Object Parameters"
//     type                              = object({
//             sa_name                       = string
//             rg_name                       = string
//     })
// }
