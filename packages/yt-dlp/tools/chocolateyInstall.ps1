$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2025.01.15/yt-dlp_x86.exe'
$checksum32 = 'f3e131c4cc0983d1c8ecd214f6df3aa4adf4c7cc6e45cefb86eb607f4a4def99'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2025.01.15/yt-dlp.exe'
$checksum64 = '16af96fe1ba8f373c0c085aa881b05b2d4a86a1757d0c1c40b6acc235c86af76'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
