$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'drawio'
  fileType       = 'MSI'
  url64bit       = 'https://github.com/jgraph/drawio-desktop/releases/download/v26.0.4/draw.io-26.0.4.msi'
  checksum64     = '0be8230a99dd3f3751762421de425774e4fd44f7c1f4ebd40f04287c4a5a6d00'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
