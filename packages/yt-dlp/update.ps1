Import-Module Chocolatey-AU

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url(32)?\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
      "(^[$]checksum(32)?\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksumType(32)?\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
      "(^[$]url64?\s*=\s*)('.*')"            = "`$1'$($Latest.URL64)'"
      "(^[$]checksum64?\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
      "(^[$]checksumType64?\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
    }
    "yt-dlp.nuspec"                 = @{
      "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
    }
  }
}

function global:au_GetLatest {
  $headers = @{
    "Accept"               = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
  }
  $Repository = "yt-dlp/yt-dlp"
  $apiUrl = "https://api.github.com/repos/$Repository/releases/latest"
  $latestRelease = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get
  $latestVersion = $latestRelease.tag_name
  return @{
    Version      = $latestVersion
    URL64        = ($latestRelease.assets | Where-Object { $_.name -match "yt-dlp.exe" }).browser_download_url
    URL          = ($latestRelease.assets | Where-Object { $_.name -match "yt-dlp_x86.exe" }).browser_download_url
    ReleaseNotes = $latestRelease.html_url
  }
}

update -ChecksumFor all
