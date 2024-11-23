$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'windirstat'
  fileType       = 'MSI'
  url64bit       = ''
  checksum64     = ''
  checksumType64 = 'sha256'
  url            = ''
  checksum       = ''
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
