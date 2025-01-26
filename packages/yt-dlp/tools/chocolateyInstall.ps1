$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2025.01.26/yt-dlp_x86.exe'
$checksum32 = 'ebbfae07713a91c87b5e0b08417ba40b0a7279af16181a4163c4921f27b070fb'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2025.01.26/yt-dlp.exe'
$checksum64 = '423eec9b60ab7910d97eb74cdb5daea90128850752d4aad6ccabaf8648d6387c'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
