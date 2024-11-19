$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.11.18/yt-dlp_x86.exe'
$checksum32 = 'fa004723d8b27ed8a5edecebe208fd4a7adbe5857e69aa0c4947c24160163a7d'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.11.18/yt-dlp.exe'
$checksum64 = '4d88a8ce1bff829c7167dd21e8b4a8eeb0db1441bc27340f0896bbe781c9c3c0'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
