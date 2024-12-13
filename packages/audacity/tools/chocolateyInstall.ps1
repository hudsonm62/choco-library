$ErrorActionPreference = 'Stop'

$url32 = 'https://github.com/audacity/audacity/releases/download/Audacity-3.7.1/audacity-win-3.7.1-32bit.exe'
$checksum32 = '7842ef996492d13eb5b3095f6e7ae976d180494e9001a6642d61f9de1ebeed49'
$url64 = 'https://github.com/audacity/audacity/releases/download/Audacity-3.7.1/audacity-win-3.7.1-64bit.exe'
$checksum64 = '5eae3e6167be049f0995d86f24273e94f763c5a2b860ddb876d753ec8a69527e'

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
