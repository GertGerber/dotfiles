#Requires -Version 5.1
$ErrorActionPreference = "Stop"

function Have($cmd){ $null -ne (Get-Command $cmd -ErrorAction SilentlyContinue) }

Write-Host "[*] Starting Windows bootstrap…" -ForegroundColor Cyan

# Ensure winget or fallback to Chocolatey
if (-not (Have "winget")) {
  Write-Host "winget not found → installing Chocolatey as fallback" -ForegroundColor Yellow
  Set-ExecutionPolicy Bypass -Scope Process -Force
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Base apps (edit to taste)
$apps = @(
  "Git.Git",
  "Microsoft.VisualStudioCode",
  "Microsoft.WindowsTerminal",
  "twpayne.chezmoi"
)

foreach($id in $apps){
  try {
    winget install --id $id --silent --accept-package-agreements --accept-source-agreements | Out-Null
  } catch {
    if (Have "choco") { choco install $id -y --no-progress | Out-Null }
  }
}

$repo = "https://github.com/GertGerber/dotfiles.git"
$dot  = Join-Path $env:USERPROFILE ".dotfiles"

# Clone/update repo
if (-not (Test-Path $dot)) {
  if (Have "git") {
    git clone --quiet $repo $dot
  } else {
    throw "Git missing even after install."
  }
} else {
  Push-Location $dot
  git pull --quiet
  Pop-Location
}

# Apply dotfiles with chezmoi (supports repo root or /dotfiles layout)
if (Have "chezmoi") {
  $src = (Test-Path (Join-Path $dot 'dotfiles')) ? (Join-Path $dot 'dotfiles') : $dot
  Push-Location $dot
  chezmoi init --apply --source $src
  Pop-Location
} else {
  Write-Warning "chezmoi not found – application of dotfiles skipped."
}

Write-Host "[✓] Windows bootstrap complete." -ForegroundColor Green
