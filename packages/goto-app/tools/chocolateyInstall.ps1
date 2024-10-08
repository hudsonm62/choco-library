$ErrorActionPreference = 'Stop'
$url = 'https://goto-desktop.goto.com/GoToSetupMachine-4.11.0-ia32.msi'
$checksum32 = 'ddc9e68f4cab5b74c066270f80a64993b2ab2f1c7412d9941e0c8fd156bb97b2'
$url64 = 'https://goto-desktop.goto.com/GoToSetupMachine-4.11.0-x64.msi'
$checksum64 = 'c154c2e57bcfa99029a2139b62080650df3173850fc935d30b46c4f80e195bd1'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url            = $url
  checksum       = $checksum32
  checksumType   = 'sha256'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  softwareName   = 'goto-app*'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOMATICUPDATES=2"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
