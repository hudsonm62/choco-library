$ErrorActionPreference = 'Stop'
$packageName = 'ntlite'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.ntlite.com/files/NTLite_setup_x86.exe'
$checksum = '411e62af919c5c88769037fd734f5f096e4f682b8e98775eec2b3b2223b3c5be'
$checksumType = 'sha256'
$url64 = 'https://downloads.ntlite.com/files/NTLite_setup_x64.exe'
$checksum64 = 'bc87d4b4ef951d8b2fa39643396e5443b3fcc93e5660213b0831f210ebd1cab4'
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
