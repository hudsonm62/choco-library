Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
        "drawio.nuspec"                 = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`$1$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_GetLatest {
    $headers = @{
        "Accept"               = "application/vnd.github+json"
        "X-GitHub-Api-Version" = "2022-11-28"
    }
    $url = "https://api.github.com/repos/jgraph/drawio-desktop/releases/latest"
    $latestRelease = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    $latestVersion = $latestRelease.name

    return @{
        Version      = $latestVersion
        URL64        = ($latestRelease.assets | Where-Object { $_.name.EndsWith(".msi") }).browser_download_url
        ReleaseNotes = $latestRelease.html_url
    }
}

update -ChecksumFor 64
