// variable "clientId" {
//   type      = string
//   sensitive = true
//   default   = ""
// }
// variable "clientSecret" {
//   type      = string
//   sensitive = true
//   default   = ""
// }
variable "use_azure_cli_auth" {
  type      = bool
  default   = true
}
 variable "subscriptionId" {
   type      = string
   sensitive = true
   default   = "1e4781cf-929f-4a42-9ffd-92aa4bec6efc"
 }
// variable "tenantId" {
//   type      = string
//   sensitive = true
//   default   = ""
// }
variable "baseIMGOS" {
  type      = string
  default   = "Windows"
}
variable "baseIMGPublisher" {
  type      = string
  default   = "MicrosoftWindowsServer"
}
variable "baseIMGOffer" {
  type      = string
  default   = "WindowsServer"
}
variable "baseIMGSKU" {
  type      = string
  default   = "2019-Datacenter-smalldisk"
}
variable "location" {
  type      = string
  default   = "westeurope"
}
variable "vmSize" {
  type      = string
  default   = "Standard_D2_v3"
}
variable "vmName" {
  type      = string
  default   = null
}
variable "rgName" {
  type      = string
  default   = "GoldenIMGs"
}
variable "galleryName" {
  type      = string
  default   = "packerimgs"
}
variable "imgName" {
  type      = string
  default   = "packerdemo"
}
variable "imgVersion" {
  type      = string
  default   = "4.0.0"
}
variable "diskType" {
  type      = string
  default   = "Standard_LRS"
}
variable "winrmTimeout" {
  type      = string
  default   = "3m"
}
variable "winrmUsername" {
  type      = string
  default   = "packer"
}
