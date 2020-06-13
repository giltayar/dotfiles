# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/giltayar/.oh-my-zsh

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
plugins=(git)

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

### NPM
alias listnpmpublished='file_name=$(npm pack) && tar -ztf $file_name && rm $file_name'

### NVM
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm install
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

### DOCKER
alias rmdocker='docker rm -fv `docker ps -a -q` ; docker network prune -f'
alias prdocker='docker system prune --volumes -f'
alias npmpublic='npm set registry https://registry.npmjs.org/'
alias sshdockervm='docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh'
function dlogs {
  docker logs `docker ps -a | grep $1 | awk '{print $1}'`
}

## AUTOJUMP
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

## JAVA
export JAVA_HOME=/Library/Java/Home

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/giltayar/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/giltayar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/giltayar/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/giltayar/google-cloud-sdk/completion.zsh.inc'; fi

# Applitools
. ~/.eyes/secrets.sh
. ~/.rendering-grid/dev.sh
export APPLITOOLS_CONCURRENCY=10000

# Bilt
alias bqt="DEBUG=bilt:* npm run test:mocha -- -b"

# Building
alias qt='DEBUG=applitools:* npm run test:mocha -- -b'
export BTPD_DEPLOYMENT_PACKAGES_BASE_DIR=~/code/mono/deployments

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/giltayar/code/rendering-grid/packages/screenshot-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/giltayar/code/rendering-grid/packages/screenshot-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/giltayar/code/rendering-grid/packages/screenshot-service/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/giltayar/code/rendering-grid/packages/screenshot-service/node_modules/tabtab/.completions/sls.zsh