$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.12.06/yt-dlp_x86.exe'
$checksum32 = '4b51687f094d31660d1ff2514d08e8005682a67996f816bff64306f0e6316e5c'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.12.06/yt-dlp.exe'
$checksum64 = '582b4f50adaef0480329e7481f819d23db91cb2dae53e3715a93299e250c5144'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
