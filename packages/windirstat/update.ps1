Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
        "windirstat.nuspec"             = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_GetLatest {
    $headers = @{
        "Accept"               = "application/vnd.github+json"
        "X-GitHub-Api-Version" = "2022-11-28"
    }
    if ($Token) {
        $headers.Add("Authorization", "Bearer $($Token)")
    }
    $url = "https://api.github.com/repos/windirstat/windirstat/releases/latest"
    $latestRelease = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    $versionMatch = $latestRelease.name | Select-String -Pattern '(\d+(\.\d+)*)' -AllMatches
    $latestVersion = $versionMatch.Matches[0].Groups[1].Value

    return @{
        Version      = $latestVersion
        URL64        = ($latestRelease.assets | Where-Object { $_.name.EndsWith("x64.msi") }).browser_download_url
        URL32        = ($latestRelease.assets | Where-Object { $_.name.EndsWith("x86.msi") }).browser_download_url
        ReleaseNotes = $latestRelease.html_url
    }
}

update -ChecksumFor all
