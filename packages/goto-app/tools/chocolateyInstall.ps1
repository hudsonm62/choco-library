$ErrorActionPreference = 'Stop'
$url = 'https://goto-desktop.goto.com/GoToSetupMachine-4.12.1-ia32.msi'
$checksum32 = 'bfd528208f8e5ade9b96493394059d583cf5f705085fe94f87860d2ea52d5f14'
$url64 = 'https://goto-desktop.goto.com/GoToSetupMachine-4.12.1-x64.msi'
$checksum64 = '5ffe627ac1b3d75e235a0b012e13aa2923d8d7c06affd55fd9b4854259cd1f65'

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
