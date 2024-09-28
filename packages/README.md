# Packages Folder

Source code for all packages live here - If you prefer, you can manually download and `choco pack` these yourself instead of using my source.

## For Contributors

### New Packages

Either package it yourself and push (if you have access), or alter the version number in the `.nuspec` before committing, so the update script picks it up and pushes it to the Package Registry.

```xml
<metadata>
  <id>package-name</id>
  <version>0.0.1</version>
  <title>Package Title</title>
</metadata>
```

### Updating Packages

**Most** packages are automatically updated by [Chocolatey-AU](https://github.com/chocolatey-community/chocolatey-au) using a [GitHub Actions Workflow](../.github/workflows/au-package-updater.yml). You can `cd` into this folder and run `Get-AUPackages` (assuming you have the module imported) to see which packages are setup for Automatic updates.

Alternatively, you can push straight to the Package repository yourself, just ensure you push any source changes to GitHub as well:

```powershell
$apikey = "your-key-here"
$source = "https://nuget.cloudsmith.io/ziro/choco-library/v2/"
choco apikey add -s "$source" -k "$apikey"
.\update_all.ps1 -SourceUri $source -PackNPush
# git commit -m "Choco AU : Manual Updates"
```

### Note

Ensure when you are creating packages for AU, you don't use `--auto` as the packaging files should be normal packages. AU doesn't need the tokens to do replacement.
