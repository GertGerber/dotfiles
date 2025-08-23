---
- name: Ensure ~/.ssh directory exists
  ansible.builtin.file:
    path: "{{ ansible_env.HOME }}/.ssh"
    state: directory
    mode: '0700'

- name: Check if ED25519 SSH key exists
  ansible.builtin.stat:
    path: "{{ ansible_env.HOME }}/.ssh/id_ed25519.pub"
  register: ssh_key

- name: Generate ED25519 SSH key if missing
  ansible.builtin.openssh_keypair:
    path: "{{ ansible_env.HOME }}/.ssh/id_ed25519"
    type: ed25519
    comment: "{{ git_user_email | default('dotfiles') }}"
    mode: '0600'
  when: not ssh_key.stat.exists

- name: Ensure ~/.ssh/config exists
  ansible.builtin.file:
    path: "{{ ansible_env.HOME }}/.ssh/config"
    state: touch
    mode: '0600'

- name: Add GitHub host config
  ansible.builtin.lineinfile:
    path: "{{ ansible_env.HOME }}/.ssh/config"
    line: |
      Host github.com
        User git
        Hostname github.com
        IdentityFile {{ ansible_env.HOME }}/.ssh/id_ed25519
        StrictHostKeyChecking no
    create: yes
    state: present
