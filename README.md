# dotfiles

Creates my dev environment for new machine.

## Supported target

- Ubuntu 24.04 noble x86_64
- Raspberry Pi OS (Debian 12) aarch64

## Prerequisite
- ansible (If ansible is installed on another control node, this is not needed)
  - Python
  - pyenv

## Create dev env

```bash
ansible-playbook install-tools.yaml --ask-become-pass
```
- put sudo password after prompt.

## TODO
- [ ] install node and npm
- [ ] separate darwin and linux
- [ ] integration test

