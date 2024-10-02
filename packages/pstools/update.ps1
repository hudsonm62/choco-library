Import-Module Chocolatey-AU

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url(32)?\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
      "(^[$]checksum(32)?\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksumType(32)?\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
    "pstools.nuspec"                = @{
      "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
    }
  }
}

function global:au_GetLatest {
  $url = "https://download.sysinternals.com/files/PSTools.zip"
  $dlPath = Join-Path $env:TEMP "PSTools.zip"
  Invoke-RestMethod -Method Get -UseBasicParsing -Uri $url -OutFile $dlPath

  $checksumType = "sha256"
  $checksum = Get-FileHash -Path $dlPath -Algorithm $checksumType

  $extractPath = Join-Path $env:TEMP "PSToolsExtracted"
  if (-not (Test-Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath | Out-Null
  }
  Add-Type -AssemblyName "System.IO.Compression.FileSystem"
  [System.IO.Compression.ZipFile]::ExtractToDirectory($dlPath, $extractPath)

  $psVersion = Get-Item -Path $(Join-Path $extractPath "psversion.txt") -Force
  $versionMatch = Get-Content -Path $psVersion -Raw | Select-String -Pattern '(\d+(\.\d+)*)' -AllMatches
  $version = $versionMatch.Matches[0].Groups[1].Value

  Remove-Item -Path $extractPath -Recurse
  Remove-Item -Path $dlPath

  return @{
    URL            = $url
    Checksum32     = $checksum.Hash.ToLower()
    ChecksumType32 = $checksum.Algorithm.ToLower()
    Version        = $version
    ReleaseNotes   = $latestRelease.html_url
  }
}

update -ChecksumFor none
