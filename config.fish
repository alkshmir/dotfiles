#if status is-interactive
#    eval (/opt/homebrew/bin/brew shellenv) 
#end

#view
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"
set -g theme_display_git_default_branch yes
set -g theme_color_scheme dark

#path
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH /usr/local/go/bin $PATH

#pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PYENV_ROOT/bin $PATH
pyenv init - | source
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#rbenv
status --is-interactive; and rbenv init - fish | source

#nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

#peco setting
set fish_plugins theme peco

function fish_user_key_bindings
  bind \cw peco_select_history
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shira/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/shira/Downloads/google-cloud-sdk/path.fish.inc'; end

# kubectl
alias k kubectl

