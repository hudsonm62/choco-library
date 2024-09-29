Import-Module Chocolatey-AU

$releases = "https://api.github.com/repos/audacity/audacity/releases/latest"

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
  function Convert-ChecksumsToObject {
    param(
      [string]$content
    )
    $lines = $content -split "`n"
    $fileObjects = @()
    # Skip the header (first two lines) and process only actual data
    foreach ($line in $lines[2..$($lines.Count - 1)]) {
      $trimmedLine = $line.Trim()
      if ($trimmedLine -match "^(?<name>\S+)\s+(?<length>\d+)\s+(?<hash>[a-fA-F0-9]+)$") { # https://regex101.com/r/VeeXc5/1
        # Create a custom object for each matched line
        $fileObject = [PSCustomObject]@{
          Name   = $matches['name']
          Length = [int]$matches['length']
          Hash   = $matches['hash']
        }
        $fileObjects += $fileObject
      }
    }
    return $fileObjects
  }
  $headers = @{
    "Accept"               = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
  }
  $latestRelease = Invoke-RestMethod -Uri $releases -Headers $headers -Method Get -UseBasicParsing
  $versionMatch = $latestRelease.name | Select-String -Pattern 'Audacity (\d+(\.\d+)*)' -AllMatches
  $version = $versionMatch.Matches[0].Groups[1].Value

  # get download info
  $x64 = $latestRelease.assets | Where-Object { $_.name.EndsWith("64bit.exe") }
  $x32 = $latestRelease.assets | Where-Object { $_.name.EndsWith("32bit.exe") }

  # get checksum info
  $allChecksum = $latestRelease.assets | Where-Object { $_.name.EndsWith(".txt") }
  $checkSumObj = Convert-ChecksumsToObject -content $(Invoke-RestMethod -Uri $allChecksum.browser_download_url -Headers $headers -Method Get -UseBasicParsing)
  $checksum64 = ($checkSumObj | Where-Object { $_.name.Equals($x64.name) }).Hash.ToLower()
  $checksum32 = ($checkSumObj | Where-Object { $_.name.Equals($x32.name) }).Hash.ToLower()

  $Latest = @{ 
    URL32        = $x32.browser_download_url
    Checksum32   = $checksum32
    URL64        = $x64.browser_download_url
    Checksum64   = $checksum64
    ReleaseNotes = $latestRelease.html_url
    Version      = $version
  }
  return $Latest
}

update -ChecksumFor all
