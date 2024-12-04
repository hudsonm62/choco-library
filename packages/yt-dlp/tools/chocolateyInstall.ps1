$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.12.03/yt-dlp_x86.exe'
$checksum32 = '52024957d98fc586395f2eefcbc5a835c5e11a8b65ffe56b2a6caf7d3439ee82'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.12.03/yt-dlp.exe'
$checksum64 = '219eaf463f31be34af73926c6bddc38f799ff28a73965f12a0a794846e7221c4'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
