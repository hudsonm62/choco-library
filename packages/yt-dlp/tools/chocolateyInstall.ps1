$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2025.02.19/yt-dlp_x86.exe'
$checksum32 = 'ae60d40be1c15a8c0f015ddb87b263f5508a616ca99114d6949f643b0746ee8e'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2025.02.19/yt-dlp.exe'
$checksum64 = 'b9fac42a19e118e1b0a5c98832928a1c25782d805a9905476bb55d479212621a'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
