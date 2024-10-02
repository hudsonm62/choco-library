Import-Module Chocolatey-AU

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url(32)?\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(^[$]checksum(32)?\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksumType(32)?\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
      "(^[$]url64?\s*=\s*)('.*')"            = "`$1'$($Latest.URL64)'"
      "(^[$]checksum64?\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
      "(^[$]checksumType64?\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
    }
    "windirstat-next.nuspec"        = @{
      "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
    }
  }
}

function global:au_GetLatest {
  $headers = @{
    "Accept"               = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
  }
  $Repository = "windirstat/windirstat-next"
  $url = "https://api.github.com/repos/$Repository/releases"
  $releases = Invoke-RestMethod -Uri $url -Headers $headers -Method Get

  $latestRelease = $releases[0]
  $assets = $latestRelease.assets
  $latestVersion = $latestRelease.tag_name

  $formattedVer = $latestVersion -replace "^Release_", "" -replace "_", "."
  $formattedVer = ($formattedVer -replace "\.(\d{4})\.(\d{2})\.(\d{2})$", '.$1$2$3')

  $x86 = $assets | Where-Object { $_.browser_download_url -like "*x86.msi" } | Select-Object -ExpandProperty browser_download_url
  $x64 = $assets | Where-Object { $_.browser_download_url -like "*x64.msi" } | Select-Object -ExpandProperty browser_download_url

  return @{
    Version      = $formattedVer
    URL64        = $x64
    URL32        = $x86
    ReleaseNotes = $latestRelease.html_url
  }
}

update -ChecksumFor all
