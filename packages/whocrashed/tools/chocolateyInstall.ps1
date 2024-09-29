$ErrorActionPreference = 'Stop'
$packageName = 'whocrashed'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.resplendence.com/download/whocrashedSetup.exe'
$checksum = '8f9f79abdb3195bd22b58cde459e45139d320677579966c202ca371d87a0a4ad'
$checksumType = 'sha256'
$url64 = 'https://www.resplendence.com/download/whocrashedSetup.exe'
$checksum64 = '8f9f79abdb3195bd22b58cde459e45139d320677579966c202ca371d87a0a4ad'
$checksumType64 = 'sha256'

$packageArgs = @{
  packageName    = $packageName
  #unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'WhoCrashed*'
  checksum       = $checksum
  checksumType   = $checksumType
  checksum64     = $checksum64
  checksumType64 = $checksumType64
}

Install-ChocolateyPackage @packageArgs
