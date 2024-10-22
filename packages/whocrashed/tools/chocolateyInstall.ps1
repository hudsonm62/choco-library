$ErrorActionPreference = 'Stop'
$packageName = 'whocrashed'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.resplendence.com/download/whocrashedSetup.exe'
$checksum = '057050931eebb9fba355bafb55e1b3ab7fe39e2975fa446371d118eb594f679f'
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
