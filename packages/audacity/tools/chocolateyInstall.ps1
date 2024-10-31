$ErrorActionPreference = 'Stop'

$url32 = 'https://github.com/audacity/audacity/releases/download/Audacity-3.7.0/audacity-win-3.7.0-32bit.exe'
$checksum32 = '84c2643dae27a26703e725f97258ba8b8d428478fa10f0df141cf093aa6f2432'
$url64 = 'https://github.com/audacity/audacity/releases/download/Audacity-3.7.0/audacity-win-3.7.0-64bit.exe'
$checksum64 = '1034c8189843c4a2f284746369ce0ec1a3667b7b10d88aca2f44b68369c2347f'

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
