# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git yarn npm autojump nx-completion)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#####
##### My Stuff
#####

### Keyboard stuff
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

### DOCKER
alias rmdocker='docker rm -fv `docker ps -a | grep -v "k8s_" | cut -d" " -f1 | tail -n +2`; docker network prune -f'

function dlogs {
  docker logs `docker ps -a | grep $1 | awk '{print $1}'`
}

## Kubernetes
alias kc=kubectl
alias kcn='kubectl config set-context `kubectl config current-context` --namespace'
alias kcd='kubectl config use-context'
alias klog="kubectl logs"
alias kcurl='kc run curl -it --image byrnedo/alpine-curl --restart Never --rm --'
alias kcg='kubectl get -o yaml'
alias kcgd='kubectl get -o yaml deploy'
alias kcgp='kubectl get -o yaml pod'
alias kwd='kubectl config current-context'

if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

rmkubens() {
	if [ `kubectl config current-context` != "docker-desktop" ]; then
		echo "cannot use if not in docker-desktop"
  else
    kubectl get ns | tail -n +2 | awk '{print $1}' | grep -v -E '^(kube-|default)' | xargs -P 3 kubectl delete namespace
  fi
}

function ksecret() {
  kubectl get secret secrets -o jsonpath="{.data.$1}" | base64 -d
}

## JAVA
export JAVA_HOME=/Library/Java/Home

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# PYTHON
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# GCloud

if [ -f '/Users/giltayar/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/giltayar/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/giltayar/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/giltayar/google-cloud-sdk/completion.zsh.inc'; fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=Trueyarn

# Secrets
. ~/.dev/secrets.sh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/giltayar/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/giltayar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/giltayar/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/giltayar/google-cloud-sdk/completion.zsh.inc'; fi

export VISUAL=vim
export EDITOR=vim

# This enables GUI apps to run in WSL
export DISPLAY=$(ip route list default | awk '{print $3}'):0
export LIBGL_ALWAYS_INDIRECT=1
sudo /etc/init.d/dbus start &> /dev/null
# export BROWSER="google-chrome --no-sandbox --disable-gpu"

# Trident Kusto
alias yrt="yarn run -T"
alias yti="yarn test:integration"
alias ytito="yarn test:integration --trace=on"
alias ytis="yarn test:integration:serve"
alias ytie="yarn test:integration:e2e"
alias yte="yarn test:e2e"
alias yteto="yarn test:e2e --trace=on"
alias ybd="time yarn build:dev:nx"
alias ybdw="yarn build:dev:watch:nx"
alias yybd="yarn && time yarn build:dev:nx"
alias ysd="yarn start:vite:nx"
alias yvc="yarn vite:clean"
alias viteclean="rm -rf ./test/integration/**/.vite; rm -rf .vite"

# Git
alias gpomr="git pull origin master"
alias gsmr="git switch master"
alias grmh="git reset --mixed HEAD~"
alias gswd="git switch --detach"

# PNPM
alias p="pnpm"
alias pi="pnpm install"
alias pb="pnpm build"
alias pib="pnpm install && pnpm run --if-present build"
alias pibt="pnpm install && pnpm run --if-present build && pnpm run --if-present test"
alias pt="pnpm test"
alias pst="pnpm start"
alias ptx="pnpm test:x"

gitcleanbuild() {
  dir_to_return_to=$PWD
  current_dir=$(basename "$PWD")
  while [ "$current_dir" != "Azure-Kusto-WebUX" ]; do
    cd ..
    current_dir=$(basename "$PWD")
  done

  time (git clean -xdf && yarn && (yarn run -T build-packages))

  cd $dir_to_return_to
}

gitcleanx() {
  dir_to_return_to=$PWD
  current_dir=$(basename "$PWD")
  while [ "$current_dir" != "Azure-Kusto-WebUX" ]; do
    cd ..
    current_dir=$(basename "$PWD")
  done

  time (git clean -xdf && yarn && cd tridentkustoextension && yarn build-deps:nx)

  cd $dir_to_return_to
}

alias create-pat="yarn run -T create-pat --output ~/.dev/secrets.sh"

cdt() {
  current_dir=$(basename "$PWD")
  while [ "$current_dir" != "Azure-Kusto-WebUX" ]; do
    cd ..
    current_dir=$(basename "$PWD")
  done

  cd tridentkustoextension
}

cdk() {
  current_dir=$(basename "$PWD")
  while [ "$current_dir" != "Azure-Kusto-WebUX" ]; do
    cd ..
    current_dir=$(basename "$PWD")
  done

  cd kustoweb
}

alias ylintype="time (yarn run lint & yarn run typecheck &; wait)"

# FNM
export PATH="/home/giltayar/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd --shell zsh)"

# pnpm installation
export PNPM_HOME="/home/giltayar/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
