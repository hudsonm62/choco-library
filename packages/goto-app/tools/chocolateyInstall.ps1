$ErrorActionPreference = 'Stop'
$url = 'https://goto-desktop.goto.com/GoToSetupMachine-4.12.2-ia32.msi'
$checksum32 = '0934ab754097dafc4530259863b7713385f5c773037c57244a7e662559c9539d'
$url64 = 'https://goto-desktop.goto.com/GoToSetupMachine-4.12.2-x64.msi'
$checksum64 = '8a41936af54d521ce8399920781750f0e1ac4dee387b79c6ecc4c95806c3d5dd'

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
