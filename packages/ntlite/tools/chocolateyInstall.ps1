$ErrorActionPreference = 'Stop'
$packageName = 'ntlite'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.ntlite.com/files/NTLite_setup_x86.exe'
$checksum = '298caba854295df375af89fa7768ae86629fd5c51e7462e7b732c7099b5b1216'
$checksumType = 'sha256'
$url64 = 'https://downloads.ntlite.com/files/NTLite_setup_x64.exe'
$checksum64 = 'c3a5fd66da6beed4e7db5c0ab439d99d925bf15fbada334115ebc40fd32a9a99'
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
