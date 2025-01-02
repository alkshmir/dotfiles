# dotfiles

Creates my dev environment for new machine.

## Prerequisite
- ansible (If ansible is installed on another control node, this is not needed)
  - Python
  - pyenv
- fish

## Create dev env

```bash
ansible-playbook install-tools.yaml --ask-become-pass
```
- put sudo password after prompt.

## TODO
- [ ] install fish
- [ ] install node
- [ ] separate darwin and linux
- [ ] integration test

