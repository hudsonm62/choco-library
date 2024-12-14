$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.12.13/yt-dlp_x86.exe'
$checksum32 = '1475646d5114aab4ea6fd41306fb39810281e766a5767ddea7b138f1f1d3e4e1'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.12.13/yt-dlp.exe'
$checksum64 = 'a11ea8bbccf8bb7a570a07223b94a22ec3235ff00a9d9dedc44078eb1942bbcc'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
