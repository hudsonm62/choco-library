Import-Module Chocolatey-AU

$versionUri = 'https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full-shared.7z.ver'
$checksumUri = 'https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full-shared.7z.sha256'
$DlUrl = 'https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full-shared.7z'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
    }
  }
}

function global:au_GetLatest {
  $checksum = (Invoke-RestMethod -Uri $checksumUri -UseBasicParsing -Method Get).ToString()
  $version = (Invoke-RestMethod -Uri $versionUri -UseBasicParsing -Method Get).ToString()
  return @{
    URL      = $DlUrl
    Version  = $version
    Checksum = $checksum
  }
}

update -ChecksumFor none
