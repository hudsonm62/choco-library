$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.09.27/yt-dlp_x86.exe'
$checksum32 = '9d4cfcbbd0683d5408c58710d5ff88f2d51545d2e407a4038a7699f773b9a807'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.09.27/yt-dlp.exe'
$checksum64 = '0410973c9914fe4e7940199a9ab91c1f83ca19f822571f825172a4d6d92ad59b'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
