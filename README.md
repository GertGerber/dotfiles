# dotfiles
Reference [TechDufus](https://github.com/TechDufus/dotfiles)

# Workstation bootstrap (Windows / WSL / Ubuntu)

**Single command** to stand up a consistent developer workstation with:

- Common CLI tooling (`git`, `curl`, `zsh`, `tmux`, `neovim`, `fzf`, `ripgrep`)
- Ansible-driven provisioning on Linux/WSL
- Winget provisioning on Windows
- Dotfiles managed by **chezmoi**
- **Starship** prompt across PowerShell and `zsh`

## Quick start

Preferred one-liner (works on Windows, WSL, and Ubuntu **with PowerShell 7** installed):

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -c "irm https://raw.githubusercontent.com/your-org/your-repo/main/unified.ps1 | iex"
```

If PowerShell 7 isn’t installed on Ubuntu yet, run this once:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/your-org/your-repo/main/get-pwsh-and-run.sh)"
```

How it works

unified.ps1 detects the platform (Windows / WSL / Linux) and executes the relevant path.

Missing prerequisites (git, ansible, chezmoi, starship, winget/choco) are installed automatically.

Dotfiles are applied with chezmoi.

Safe to re-run; operations are idempotent.

Repo URL

Update RepoUrl in unified.ps1 to point to your actual repository, or keep the default if this is the canonical project.

Security note (recommended)

Review scripts before running.

Optionally pin to a commit for immutability, for example:

```bash
pwsh -NoProfile -ExecutionPolicy Bypass -c "irm https://raw.githubusercontent.com/your-org/your-repo/<COMMIT_SHA>/unified.ps1 | iex"
```
