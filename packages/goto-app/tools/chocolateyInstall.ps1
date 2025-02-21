$ErrorActionPreference = 'Stop'
$url = 'https://goto-desktop.goto.com/GoToSetupMachine-4.13.0-ia32.msi'
$checksum32 = 'a3c250de79ba717e61627013d2bff37d54ba2a86e245661589752a0f9795a0a6'
$url64 = 'https://goto-desktop.goto.com/GoToSetupMachine-4.13.0-x64.msi'
$checksum64 = '45e9cf366c71ab8d26d38051578055ac85f0d922e063f56373e65e5b406e08b3'

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
