$ErrorActionPreference = 'Stop'
$url = 'https://github.com/windirstat/windirstat-next/releases/download/Release_2_0_0_2024_09_19/WinDirStat-x86.msi'
$checksum = 'e69c26dcf72a50a968a8b67ad7fc36833a9093d429da94c0d4fca94a9f8c86a5'
$checksumType = 'sha256'
$url64 = 'https://github.com/windirstat/windirstat-next/releases/download/Release_2_0_0_2024_09_19/WinDirStat-x64.msi'
$checksum64 = 'd562f584bcd0a0ee902e513d69d15bfe43857baf5ec0efdaee84224ac6a99f0a'
$checksumType64 = 'sha256'

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
