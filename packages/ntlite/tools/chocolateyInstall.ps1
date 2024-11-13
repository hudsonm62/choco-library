$ErrorActionPreference = 'Stop'
$packageName = 'ntlite'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.ntlite.com/files/NTLite_setup_x86.exe'
$checksum = 'cf622ae575c40a28b0affd049c965c0fb9b1b577f952612c105fab84efc77bd7'
$checksumType = 'sha256'
$url64 = 'https://downloads.ntlite.com/files/NTLite_setup_x64.exe'
$checksum64 = 'a6126e3d4cec3565a8e1b70f67a0a277c2902b5de784ce22722943bdb32a19ad'
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
