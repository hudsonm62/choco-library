$ErrorActionPreference = 'Stop'
$url = 'https://meet.goto.com/openerbinaries/latest/GoToOpenerMultiUser.msi'
$checksum32 = '5704f69e0556642cfcaa9f5a80ac1c3f9ebcb6a8a14214d904034365271fe44b'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url            = $url
  softwareName   = 'goto-opener*'
  checksum       = $checksum32
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
