$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'drawio'
  fileType       = 'MSI'
  url64bit       = 'https://github.com/jgraph/drawio-desktop/releases/download/v26.0.16/draw.io-26.0.16.msi'
  checksum64     = '5e926d0a0d3fd03c35d20e1f18f1c60ac14594ee22e6c3506670abebf8437db4'
  checksumType64 = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
