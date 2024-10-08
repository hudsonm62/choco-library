$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.10.07/yt-dlp_x86.exe'
$checksum32 = '06fd338f7e1c179b7d6ccd4212ab3f2f1861ea9c5f5cd9d7ef0c1254eaf69a27'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.10.07/yt-dlp.exe'
$checksum64 = 'fdf3856b6392e9b96637229294993dae2331f2565fcdfc8cccada74927dc31bb'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
