Import-Module Chocolatey-AU

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url(32)?\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]checksum(32)?\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $jsonContent = Get-Content -Path "./version.json" -Raw
  $json = $jsonContent | ConvertFrom-Json

  $apiUrl = "https://meet.goto.com/openerbinaries/latest/GoToOpenerMultiUser.msi"
  $checksum = Get-RemoteChecksum $apiUrl -Algorithm "sha256"

  $latestVersion = ""
  # Check if the local checksum differs from the remote checksum
  if ($json.sha256 -ne $checksum) {
    $latestVersion = Get-Date -Format "yyyy.MM.dd"

    # Modify JSON with new values
    $json.Version = $latestVersion
    $json.sha256 = $checksum
    $json | ConvertTo-Json -Depth 3 | Set-Content -Path "./version.json"
  }
  else {
    $latestVersion = $json.Version
  }

  return @{
    Version        = $latestVersion
    URL            = $apiUrl
    Checksum32     = $checksum
  }
}

update -ChecksumFor none
