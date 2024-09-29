$ErrorActionPreference = 'Stop'
$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full-shared.7z'
$checksum = 'a0b6e8c7978b95d019a93dcf4b4ab74b17d9e53e0a87cfd463e1376c5927e30b'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsPath
  url           = $url
  checksum      = $checksum
  checksumType  = "sha256"
}

Install-ChocolateyZipPackage @packageArgs
Write-Host "$packageName installed to $toolsPath"
