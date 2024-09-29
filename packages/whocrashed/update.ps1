import-module Chocolatey-AU

function global:au_SearchReplace {
	@{
		'tools/chocolateyInstall.ps1' = @{
			"(^[$]url(32)?\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
			"(^[$]checksum(32)?\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
			"(^[$]url64?\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
			"(^[$]checksum64?\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
		}
	}
}

$url = "https://www.resplendence.com/whocrashed"
$dlUrl = "https://www.resplendence.com/download/whocrashedSetup.exe"
function global:au_GetLatest {
	$page = Invoke-RestMethod $url -Method Get -UseBasicParsing
	$checksum = Get-RemoteChecksum -Url $dlUrl
	$regexPattern = 'Latest version: v(\d+(\.\d+)*)'
	$versionMatch = $page | Select-String -Pattern $regexPattern -AllMatches
	$version = $versionMatch.Matches[0].Groups[1].Value

	$Latest = @{ 
		Version    = $version
		URL32      = $dlUrl
		Checksum32 = $checksum
		URL64      = $dlUrl
		Checksum64 = $checksum
	}
	return $Latest
}

update -ChecksumFor all
