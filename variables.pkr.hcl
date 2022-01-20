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
   default   = "51693fff-9399-4139-9c8e-57c93f889896"
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
  default   = "GalTestBatch"
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
