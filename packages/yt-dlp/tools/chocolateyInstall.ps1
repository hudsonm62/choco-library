$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.10.22/yt-dlp_x86.exe'
$checksum32 = 'ba63c0a53d1f50d1ee1e2e5e87839c5a1321cbeaaf4196003b7aee46c591b364'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.10.22/yt-dlp.exe'
$checksum64 = '427f257578b99227e5364a0712bee649cab849be43e4916fe23a136305fd0151'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
