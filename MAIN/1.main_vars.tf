variable "sub-10" {
  default = "c6484eee-b936-412a-94d6-8dc1b4386bc2"
}

variable "sub-06" {
  default = "82fec995-d706-4757-a002-6bfc2d89631a"
}

variable "sub-03" {
  default = "4dc4b888-e3bc-4c76-951b-4ece151e3f19"
}

#Location of all lab stuff
variable "location-swc" {
  default="Sweden Central"
}

variable "location-plc" {
  default="Poland Central"
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