$ErrorActionPreference = 'Stop'
$packageName = 'ntlite'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.ntlite.com/files/NTLite_setup_x86.exe'
$checksum = '9a03c543e778f36239e3d610bb5d0372c419bf6d6093043f8efd4e5da56f9500'
$checksumType = 'sha256'
$url64 = 'https://downloads.ntlite.com/files/NTLite_setup_x64.exe'
$checksum64 = 'eca19963631037092eedee1c353dccff604d9133985c7d76525caec2b0b007d3'
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
