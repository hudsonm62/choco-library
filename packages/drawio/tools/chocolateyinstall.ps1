$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'drawio'
  fileType       = 'MSI'
  url64bit       = 'https://github.com/jgraph/drawio-desktop/releases/download/v24.7.17/draw.io-24.7.17.msi'
  checksum64     = '49db12e39fa90fb926a9c886d5a1d8b2c051a9dc37b61ea3ad3f3d59d540bf55'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
