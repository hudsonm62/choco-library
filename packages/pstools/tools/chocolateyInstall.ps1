﻿$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://download.sysinternals.com/files/PSTools.zip'
$checksum = 'a9ca77dfe03ce15004157727bb43ba66f00ceb215362c9b3d199f000edaa8d61'
$checksumType = 'sha256'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64
  checksum      = $checksum
  checksumType  = $checksumType
}

Install-ChocolateyZipPackage @packageArgs

if ($true -eq (Get-PackageParameters)['acceptEula']) {
  $regRoot = "HKCU:\Software\Sysinternals"
  if (!(Test-Path $regRoot)) {
    New-Item -Path "$regRoot" | Out-Null
  }
  foreach ($pkg in $regPkg) {
    $regPath = Join-Path $regRoot $pkg
    if (!(Test-Path $regPath)) {
      New-Item -Path "$regRoot" -Name "$pkg" | Out-Null
    }
    Set-ItemProperty -Path "$regPath" -Name EulaAccepted -Value 1
    if ((Get-ItemProperty -Path "$regPath").EulaAccepted -ne 1) {
      throw "Failure updating registry to indicate EULA acceptance"
    }
  }

  Write-Output "EULA Accepted using /acceptEula"
}
