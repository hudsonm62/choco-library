$ErrorActionPreference = 'Stop'
$url = ''
$checksum = ''
$checksumType = ''
$url64 = ''
$checksum64 = ''
$checksumType64 = ''

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url            = $url
  checksum       = $checksum
  checksumType   = $checksumType
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
