Import-Module Chocolatey-AU

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url64?\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^[$]checksum64?\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
    "lime3ds.nuspec"                = @{
      "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
    }
  }
}

function global:au_GetLatest {
  $headers = @{
    "Accept"               = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
  }
  $Repository = "lime3ds/lime3ds"
  $apiUrl = "https://api.github.com/repos/$Repository/releases/latest"
  $latestRelease = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get
  $latestVersion = $latestRelease.tag_name
  return @{
    Version      = $latestVersion
    URL64        = ($latestRelease.assets | Where-Object { $_.name -match "msys2-installer.exe" }).browser_download_url
    ReleaseNotes = $latestRelease.html_url
  }
}

update -ChecksumFor 64
