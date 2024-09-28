# Chocolatey Packages Library

[![Actions Tests](https://img.shields.io/github/actions/workflow/status/hudsonm62/choco-library/test-ci.yml?branch=master&logo=githubactions&style=for-the-badge&label=tests)](https://github.com/hudsonm62/choco-library/actions/workflows/test-ci.yml) [![Hosted By: Cloudsmith](https://img.shields.io/badge/OSS%20hosting%20by-cloudsmith-blue?logo=cloudsmith&style=for-the-badge)](https://cloudsmith.com) [![Report Broken Packages](https://img.shields.io/badge/broken%20packages-red?style=for-the-badge&logo=github&label=report&link=https%3A%2F%2Fgithub.com%2Fhudsonm62%2Fchoco-library%2Fissues%2Fnew%2Fchoose)](https://github.com/hudsonm62/choco-library/issues/new/choose)

## hudsonm62/choco-library

This repository contains my personal Chocolatey Packages (not on the chocolatey community). Mostly for my own day-to-day use and convenience, but feel free to use it as everything should be fairly stable.

### Usage

#### One-off Install

```powershell
choco install Package.Name -s "https://nuget.cloudsmith.io/ziro/choco-library/v2/"
```

#### Add to Sources

```powershell
choco source add -n choco-library -s "https://nuget.cloudsmith.io/ziro/choco-library/v2/"
choco install Package.Name -s choco-library
```

### Contributing

Contributing is welcome and appreciated.

#### Setup

- Ensure you have the [Chocolatey PowerShell profile](https://chocolatey.org/docs/troubleshooting#why-does-choco-intab-not-work-for-me) installed.
- Open [`au_setup.ps1`](./au_setup.ps1) in an editor and review it.
- Run PowerShell 5.x as Admin.
- Run [`au_setup.ps1`](./au_setup.ps1).

#### Broken / Outdated Packages

Packages are automatically updated with [Chocolatey-AU](https://github.com/chocolatey-community/chocolatey-au) via [GitHub Actions](https://github.com/hudsonm62/choco-library/actions/new) - Please create an [issue](https://github.com/hudsonm62/choco-library/issues/new/choose) and provide as much detail as possible. Alternatively, submit a [Pull Request](https://github.com/hudsonm62/choco-library/compare) with any proposed changes.

## Cloudsmith

[![Hosted By: Cloudsmith](https://img.shields.io/badge/OSS%20hosting%20by-cloudsmith-blue?logo=cloudsmith&style=for-the-badge)](https://cloudsmith.com)

Package repository hosting is graciously provided by [Cloudsmith](https://cloudsmith.com).
Cloudsmith is the only fully hosted, cloud-native, universal package management solution, that
enables your organization to create, store and share packages in any format, to any place, with total
confidence.
