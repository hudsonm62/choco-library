# Based on AU Packages Template: https://github.com/majkinetor/au-packages-template

param(
    [string] $Name, [string] $ForcedPackages, [string] $Root = "$PSScriptRoot\packages", 
    [uri]$SourceUri, [switch]$PackNPush = $false
)

if (Test-Path $PSScriptRoot/update_vars.ps1) { . $PSScriptRoot/update_vars.ps1 }

$Options = [ordered]@{
    Timeout             = 100                                     #Connection timeout in seconds
    UpdateTimeout       = 1200                                    #Update timeout in seconds
    Threads             = 10                                      #Number of background jobs to use
    Push                = $false #$Env:au_Push -eq 'true'         #Push to chocolatey - disabled since im pushing to my own Cloudsmith instead
    PluginPath          = ''                                      #Path to user plugins
    NoCheckChocoVersion = $true

    Report              = @{
        Type   = 'markdown'                                   #Report type: markdown or text
        Path   = "$PSScriptRoot\Update-AUPackages.md"         #Path where to save the report
        Params = @{                                          #Report parameters:
            Github_UserRepo = $Env:github_user_repo         #  Markdown: shows user info in upper right corner
            NoAppVeyor      = $true                             #  Markdown: do not show AppVeyor build shield
            UserMessage     = "[History](#update-history)"      #  Markdown, Text: Custom user message to show
            NoIcons         = $false                            #  Markdown: don't show icon
            IconSize        = 32                                #  Markdown: icon size
            Title           = ''                                #  Markdown, Text: TItle of the report, by default 'Update-AUPackages'
        }
    }

    History             = @{
        Lines           = 30                                          #Number of lines to show
        Github_UserRepo = $Env:github_user_repo             #User repo to be link to commits
        Path            = "$PSScriptRoot\Update-History.md"            #Path where to save history
    }

    RunInfo             = @{
        Exclude = 'password', 'apikey', 'apitoken'          #Option keys which contain those words will be removed
        Path    = "$PSScriptRoot\update_info.xml"           #Path where to save the run info
    }

    ForcedPackages      = $ForcedPackages -split ' '
    BeforeEach          = {
        param($PackageName, $Options )
        $p = $Options.ForcedPackages | Where-Object { $_ -match "^${PackageName}(?:\:(.+))*$" }
        if (!$p) { return }

        $global:au_Force = $true
        $global:au_Version = ($p -split ':')[1]
    }

    #Gist = @{
    #    Id     = $Env:gist_id                               #Your gist id; leave empty for new private or anonymous gist
    #    ApiKey = $Env:github_api_key                        #Your github api key - if empty anoymous gist is created
    #    Path   = "$PSScriptRoot\Update-AUPackages.md", "$PSScriptRoot\Update-History.md"       #List of files to add to the gist
    #}
    #Git = @{
    #    User     = ''                                       #Git username, leave empty if github api key is used
    #    Password = $Env:github_api_key                      #Password if username is not empty, otherwise api key
    #}
}

if ($ForcedPackages) { Write-Output "FORCED PACKAGES: $ForcedPackages" }
$global:au_Root = $Root                                    #Path to the AU packages
$global:info = updateall -Name $Name -Options $Options

# Upload step summary
if ($env:CI) {
    $env:GITHUB_STEP_SUMMARY = $(Get-Content "./Update-AUPackages.md" -Raw)
}

if ($PackNPush -eq $true) {
    foreach ($package in $global:info) {
        $PkgName = $package.Name
        $package_dir = $package.Path
        if ($package.Updated -ne $true) {
            Write-Output "Package '$PkgName' was not updated, skipping pack/push..."
            continue
        }
        if (!(Test-Path $package_dir)) {
            Write-Output "::warning title=Missing $PkgName::'$PkgName' could not be located at '$package_dir' despite being updated by AU."
            continue
        }

        try {
            Write-Output "PACKAGING: $PkgName"
            Push-Location $package_dir
            choco pack
            if ($null -eq $SourceUri) {
                Write-Warning "SourceUri variable is null - Skipping 'choco push'.."
            }
            else {
                Write-Output "Pushing to '$SourceUri'"
                choco push --source $SourceUri # set apikey with 'choco apikey set'
            }
        }
        catch {
            Write-Output "::error title=$PkgName Packaging Error::$_"
        }
        finally {
            Pop-Location 
        }

    }
    Write-Output "::notice file=Update-History.md::$($global:info.Count) Packages updated and pushed"
}
