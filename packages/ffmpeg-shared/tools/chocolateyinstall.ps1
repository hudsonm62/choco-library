$ErrorActionPreference = 'Stop'
$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full-shared.7z'
$checksum = '01915dfe8591248be20d3d83453c91c1f71cfd10c07460e6fa2d2e667f513606'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsPath
  url           = $url
  checksum      = $checksum
  checksumType  = "sha256"
}

Install-ChocolateyZipPackage @packageArgs
Write-Host "$packageName installed to $toolsPath"
