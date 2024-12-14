$ErrorActionPreference = 'Stop'
$packageName = 'ntlite'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.ntlite.com/files/NTLite_setup_x86.exe'
$checksum = '4f99af36d000f5a9dd56d2a5f626dda25d13293ce54d3053c8d1275bdf94fc8c'
$checksumType = 'sha256'
$url64 = 'https://downloads.ntlite.com/files/NTLite_setup_x64.exe'
$checksum64 = 'b366da0b6350f00b75e6ae8dad5ff26c7723fe5b9a2d58dde66a1906349d8d21'
$checksumType64 = 'sha256'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  validExitCodes = @(0)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName   = 'NTLite*'
  checksum       = $checksum
  checksumType   = $checksumType
  checksum64     = $checksum64
  checksumType64 = $checksumType64
}

Install-ChocolateyPackage @packageArgs
