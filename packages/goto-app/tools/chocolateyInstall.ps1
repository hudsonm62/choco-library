$ErrorActionPreference = 'Stop'
$url = 'https://goto-desktop.goto.com/GoToSetupMachine-4.12.0-ia32.msi'
$checksum32 = '58ece3d5aaf11aadfb5cbdb06eaf0966a73af3cfb19711c5844ed89aa6f78887'
$url64 = 'https://goto-desktop.goto.com/GoToSetupMachine-4.12.0-x64.msi'
$checksum64 = '6d6be4e573341f72af1430930f62def7644b116b28d96734ebac9e3d2688e0b1'

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
