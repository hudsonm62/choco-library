$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'drawio'
  fileType       = 'MSI'
  url64bit       = 'https://github.com/jgraph/drawio-desktop/releases/download/v26.0.15/draw.io-26.0.15.msi'
  checksum64     = '004dad36132fd3daca91521580c8ac60167073ef4c9053ec1d7f4e06ecb0bad0'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
