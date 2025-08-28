# Change Log – Reviewed for Ubuntu 24.04 / Ansible
Updated: 2025-08-28 07:36 NZ

## Key fixes
- Replaced deprecated `apt_key` usage with keyring + `signed-by` across affected roles.
- Rewrote truncated/invalid task files.
- Added Kubernetes defaults so `k8s.repo.version` resolves.
- Restored empty `alacritty` task file to a working installer.
- Simplified and hardened `pre_tasks/detect_sudo.yml`.

## Files updated
- dotfiles-main/pre_tasks/detect_sudo.yml
- dotfiles-main/roles/1password/tasks/Ubuntu.yml
- dotfiles-main/roles/alacritty/tasks/Ubuntu.yml
- dotfiles-main/roles/azure/tasks/Ubuntu.yml
- dotfiles-main/roles/docker/tasks/Ubuntu.yml
- dotfiles-main/roles/helm/tasks/Ubuntu.yml
- dotfiles-main/roles/k8s/defaults/main.yml
- dotfiles-main/roles/k8s/tasks/Ubuntu.yml
- dotfiles-main/roles/nomad/tasks/Ubuntu.yml
- dotfiles-main/roles/pwsh/tasks/Ubuntu.yml
- dotfiles-main/roles/terraform/tasks/Ubuntu.yml
- dotfiles-main/roles/warp/tasks/Ubuntu.yml

## Heads-up: scripts invoking `sudo`
These scripts call `sudo` inside. When run from Ansible with `become: true`, this can hang or prompt unexpectedly. Consider removing `sudo` from the scripts themselves:
- dotfiles-main/roles/1password/uninstall.sh
- dotfiles-main/roles/alacritty/uninstall.sh
- dotfiles-main/roles/asciiquarium/uninstall.sh
- dotfiles-main/roles/aws/uninstall.sh
- dotfiles-main/roles/bash/files/bash/pkg_functions.sh
- dotfiles-main/roles/bash/files/os/Archlinux/os_functions.sh
- dotfiles-main/roles/bash/files/os/Ubuntu/os_functions.sh
- dotfiles-main/roles/bat/uninstall.sh
- dotfiles-main/roles/btop/uninstall.sh
- dotfiles-main/roles/docker/uninstall.sh
- dotfiles-main/roles/fonts/uninstall.sh
- dotfiles-main/roles/fzf/uninstall.sh
- dotfiles-main/roles/gh/uninstall.sh
- dotfiles-main/roles/glab/uninstall.sh
- dotfiles-main/roles/go/uninstall.sh
- dotfiles-main/roles/helm/uninstall.sh
- dotfiles-main/roles/jj/uninstall.sh
- dotfiles-main/roles/just/uninstall.sh
- dotfiles-main/roles/k8s/uninstall.sh
- dotfiles-main/roles/k9s/uninstall.sh
- dotfiles-main/roles/kind/uninstall.sh
- dotfiles-main/roles/kitty/uninstall.sh
- dotfiles-main/roles/lazygit/uninstall.sh
- dotfiles-main/roles/lsd/uninstall.sh
- dotfiles-main/roles/lua/uninstall.sh
- dotfiles-main/roles/ncdu/uninstall.sh
- dotfiles-main/roles/neovim/uninstall.sh
- dotfiles-main/roles/podman/uninstall.sh
- dotfiles-main/roles/starship/uninstall.sh
- dotfiles-main/roles/system/uninstall.sh
... and 13 more.
