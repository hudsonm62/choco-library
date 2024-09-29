$ErrorActionPreference = 'Stop'

$url32 = 'https://github.com/audacity/audacity/releases/download/Audacity-3.6.4/audacity-win-3.6.4-32bit.exe'
$checksum32 = 'dcc10df1e55d2db753a2d4e29fb7fad7018352a035fa72ce91b052e8ec317c38'
$url64 = 'https://github.com/audacity/audacity/releases/download/Audacity-3.6.4/audacity-win-3.6.4-64bit.exe'
$checksum64 = 'b11b3a96639d78ed295ca8a426da628dea951a965bfbce170708de5d4a93a75d'

$packageArgs = @{
  packageName    = "audacity"
  fileType       = "EXE"
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  url            = $url32
  url64bit       = $url64
  softwareName   = 'audacity*'
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
