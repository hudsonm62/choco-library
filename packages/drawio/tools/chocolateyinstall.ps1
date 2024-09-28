$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = 'drawio'
  fileType      = 'MSI'
  url64bit      = 'https://github.com/jgraph/drawio-desktop/releases/download/v24.7.8/draw.io-24.7.8.msi'
  checksum64    = 'c10a2b4f5a1438549db3bf387f8a20e73aa55eacb78ddf9945dc1e073bfea442'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
