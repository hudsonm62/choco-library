$ErrorActionPreference = 'Stop'
$url = 'https://github.com/yt-dlp/yt-dlp/releases/download/2025.01.12/yt-dlp_x86.exe'
$checksum32 = 'bf1b708d783eb356c2779bfcfd53d561968f5f83e11d667b9fe365ff14d682c4'
$checksumType32 = 'sha256'
$url64 = 'https://github.com/yt-dlp/yt-dlp/releases/download/2025.01.12/yt-dlp.exe'
$checksum64 = '62175d4ef98f504d12de95ea121fb9e0616eaf2b0c8101c8a4ce6ba68000cf05'
$checksumType64 = 'sha256'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile -PackageName 'yt-dlp' -FileFullPath "$toolsDir\yt-dlp.exe" `
  -Url $url -Checksum $checksum32 -ChecksumType $checksumType32 `
  -Url64bit $url64 -CheckSum64 $checksum64 -ChecksumType64 $checksumType64
