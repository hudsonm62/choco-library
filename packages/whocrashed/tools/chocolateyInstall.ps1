$ErrorActionPreference = 'Stop'
$packageName = 'whocrashed'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.resplendence.com/download/whocrashedSetup.exe'
$checksum = '8f9f79abdb3195bd22b58cde459e45139d320677579966c202ca371d87a0a4ad'
$checksumType = 'sha256'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'WhoCrashed*'
  checksum       = $checksum
  checksumType   = $checksumType
}

Install-ChocolateyPackage @packageArgs
