$uninstallPath = ''
if (Get-OSArchitectureWidth -eq 64) {
  $uninstallPath = "$env:ProgramFiles\WhoCrashed\unins000.exe"
}
else {
  $uninstallPath = "${env:ProgramFiles(x86)}\WhoCrashed\unins000.exe"
}

Uninstall-ChocolateyPackage 'whocrashed' 'EXE' '/S /VERYSILENT' $uninstallPath
