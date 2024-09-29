$uninstallPath = ''
if (Get-OSArchitectureWidth -eq 64) {
  $uninstallPath = "$env:ProgramFiles\Audacity\unins000.exe"
}
else {
  $uninstallPath = "${env:ProgramFiles(x86)}\Audacity\unins000.exe"
}

Uninstall-ChocolateyPackage 'audacity' 'EXE' '/S /VERYSILENT' $uninstallPath
