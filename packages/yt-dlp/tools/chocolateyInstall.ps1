$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.12.23/yt-dlp_x86.exe'
$checksum32 = 'fbd4a497ef3357abe81e955bbd1437cc9bc43c23d2361aeb20e20edb1a996be6'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.12.23/yt-dlp.exe'
$checksum64 = '8c59be7685e19816a7108e1e2208b83c937ec10ee101fec15edae229a7e3a0dc'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
