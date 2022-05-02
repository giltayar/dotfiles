# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# PYTHON
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# FNM
eval "$(fnm env)"
eval "$(/opt/homebrew/bin/brew shellenv)"
