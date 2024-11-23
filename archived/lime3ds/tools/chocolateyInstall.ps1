$ErrorActionPreference = 'Stop'
$url64 = 'https://github.com/Lime3DS/Lime3DS/releases/download/2119.1/lime3ds-2119.1-windows-msys2-installer.exe'
$checksum64 = '50684e939766d197fe466bfe92c11bc28511e020eca93382c68fdde3b4ee9156'

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
