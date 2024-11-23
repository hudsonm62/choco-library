Import-Module Chocolatey-AU

function global:au_SearchReplace {
  @{
    'tools/chocolateyInstall.ps1' = @{
      "(^[$]url(32)?\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(^[$]checksum(32)?\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]url64?\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
      "(^[$]checksum64?\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
    }
    "audacity.nuspec"             = @{
      "(\<releaseNotes\>).*?(\<\/releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
    }
  }
}

function global:au_GetLatest {
  $Repository = "audacity/audacity"
  $apiUrl = "https://api.github.com/repos/$Repository/releases/latest"
  $headers = @{
    Accept                 = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
  }
  if ($Token) {
    $headers.Add("Authorization", "Bearer $($Token)")
  }

  $latestRelease = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get -UseBasicParsing

  $versionMatch = $latestRelease.name | Select-String -Pattern 'Audacity (\d+(\.\d+)*)' -AllMatches
  $version = $versionMatch.Matches[0].Groups[1].Value

  $x64 = $latestRelease.assets | Where-Object { $_.name.EndsWith("64bit.exe") }
  $x32 = $latestRelease.assets | Where-Object { $_.name.EndsWith("32bit.exe") }

  return @{ 
    URL32        = $x32.browser_download_url
    URL64        = $x64.browser_download_url
    ReleaseNotes = $latestRelease.html_url
    Version      = $version
  }
}

update -ChecksumFor all
