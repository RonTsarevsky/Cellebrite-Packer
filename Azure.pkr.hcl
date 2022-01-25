locals {
  imgName = join("-", [var.imgName, var.imgVersion])
}
source "azure-arm" "GoldenIMG" {
  // client_id                         = var.clientId
  // client_secret                     = var.clientSecret
  use_azure_cli_auth                = var.use_azure_cli_auth
  // subscription_id                   = var.subscriptionId
  // tenant_id                         = var.tenantId
  os_type                           = var.baseIMGOS
  image_publisher                   = var.baseIMGPublisher
  image_offer                       = var.baseIMGOffer
  image_sku                         = var.baseIMGSKU
  location                          = var.location
  vm_size                           = var.vmSize
  managed_image_resource_group_name = var.rgName
  communicator                      = var.baseIMGOS == "Linux" ? "ssh" : "winrm"
  winrm_insecure                    = "true"
  winrm_timeout                     = var.winrmTimeout
  winrm_use_ssl                     = "true"
  winrm_username                    = var.winrmUsername
  managed_image_name                = local.imgName != null ? local.imgName : var.imgName
  shared_image_gallery_destination {
    subscription         = var.subscriptionId
    resource_group       = var.rgName
    gallery_name         = var.galleryName
    image_name           = var.imgName
    image_version        = var.imgVersion
    replication_regions  = [var.location]
    storage_account_type = var.diskType
  }
}
build {
  sources = ["sources.azure-arm.GoldenIMG"]

  provisioner "powershell" {
    inline = [
      "(Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1' -UseBasicParsing).content | Out-File $env:temp\\ConfigureRemotingForAnsible.ps1",
      "powershell.exe -ExecutionPolicy ByPass -File $env:temp\\ConfigureRemotingForAnsible.ps1 -EnableCredSSP",
      "Set-Service RdAgent -StartupType Disabled",
      "Set-Service WindowsAzureTelemetryService -StartupType Disabled",
      "Set-Service WindowsAzureGuestAgent -StartupType Disabled",
      "Remove-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\SysPrepExternal\\Generalize' -Name '*'"
    ]
  }
  provisioner "powershell" {
    script = "fileShare.ps1"
    
  }

  provisioner "powershell" {
    inline = [
      "& $env:SystemRoot\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /quiet /quit /mode:vm",
      "while($true) { $imageState = Get-ItemProperty HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\State | Select ImageState; if($imageState.ImageState -ne 'IMAGE_STATE_GENERALIZE_RESEAL_TO_OOBE') { Write-Output $imageState.ImageState; Start-Sleep -s 10  } else { break } }"
    ]
  }

  # post-processor "manifest" {}
}










