$ErrorActionPreference = 'Stop'
$url64 = 'https://github.com/Lime3DS/Lime3DS/releases/download/2118.2/lime3ds-2118.2-windows-msys2-installer.exe'
$checksum64 = '1e1ae8cf66d6502c3eb20fbf28d0fb477c9aa1aa3fe7b4e37e46bb79d33e7d12'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  checksumType   = 'sha256'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  softwareName   = 'Lime3DS*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
