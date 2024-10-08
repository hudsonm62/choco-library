Import-Module Chocolatey-AU

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url(32)?\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(^[$]checksum(32)?\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]url64?\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
      "(^[$]checksum64?\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
  $apiUrl = "https://support.goto.com/meeting/help/whats-new-in-the-goto-app"
  $download_page = Invoke-WebRequest -Uri $apiUrl -UseBasicParsing

  $regex64 = '.x64.msi$'
  $url64 = $download_page.links | Where-Object href -match $regex64 | Select-Object -First 1 -expand href

  $regex32 = '.ia32.msi$'
  $url32 = $download_page.links | Where-Object href -match $regex32 | Select-Object -First 1 -expand href
  
  $version = $url64 | Select-String -Pattern '(\d+(\.\d+)*)'
  $version = $version.Matches[0].Value
  return @{
    URL32   = $url32
    URL64   = $url64
    Version = $version
  }
}

update -ChecksumFor all
