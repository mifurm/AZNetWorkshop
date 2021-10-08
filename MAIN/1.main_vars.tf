#Location of all lab stuff
variable "location" {
  default="westeurope"
}

#Number of networks to create
variable "number-of-net" {
  default = "4"
}

#Default User
variable "default-admin-username" {
  default = "defadminuser"
}

#Default Password
variable "default-admin-pass" {
  default = "P@ssW0rd!"
}

#VNET HUB ADDRESS
variable "vnet-hub" {
 default=["10.10.0.0/16"]
}

#VNET GLOBAL ADDRESS
variable "vnet-global" {
 default=["10.50.0.0/16"]
}

#VNET DEV ADDRESS
variable "vnet-dev" {
 default=["10.100.0.0/16"]
}

#VNET HUB GATEWAY SUBNET ADDRESS
variable "vnet-hub-gatewaysubnet" {
 default=["10.10.0.0/28"]
}

#VNET GLOBAL FIREWALL SUBNET ADDRESS
variable "vnet-global-azurefirewall-subnet" {
 default=["10.50.0.0/28"]
}

variable "resource_group_name" {
   default="karol-test"
}

variable "db_name" {
  default="karol"
}

variable "db_pass" {
  default="H@Sh1CoR3!"
}
