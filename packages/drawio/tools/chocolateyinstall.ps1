$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'drawio'
  fileType       = 'MSI'
  url64bit       = 'https://github.com/jgraph/drawio-desktop/releases/download/v26.0.3/draw.io-26.0.3.msi'
  checksum64     = '13ff5a69b00a8d2bafe2c58a9d79e36022acacc823cbbb2ddbee432e3f55b98f'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
