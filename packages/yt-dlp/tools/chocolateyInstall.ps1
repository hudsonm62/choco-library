$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.11.04/yt-dlp_x86.exe'
$checksum32 = '3505f7ab528ef72d1894e40081b8ab508a4efe64ee917e4a9caf52e3a58fd2ac'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2024.11.04/yt-dlp.exe'
$checksum64 = '504dbcb3cb6ba2e9207a79c1010d9a7663e74de674ee6983a5c72642698c1ad5'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
