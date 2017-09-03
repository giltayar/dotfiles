# dotfiles

My dotfiles for Mac

## Installation

First install `brew` (install instructions [here](http://brew.sh/)).

Then install `rcm` (manual [here](http://thoughtbot.github.io/rcm/rcm.7.html)):

```bash
brew tap thoughtbot/formulae
brew install rcm
```

Then clone this repo into your HOME directory, into `.dotfiles`:

```bash
git clone git@github.com:giltayar/dotfiles.git ~/.dotfiles
```

Then update the symlinks from the `.dotfiles` to your HOME dir:

```bash
~/.dotfiles/install-dotfiles
```

This runs rcup and ignores some files that are not dotfiles.
It also installs other files that are not under rcup supervision.

### Updating files that are not under rcup supervision

```bash
~/.dotfiles/update-dotfiles-here
```

This will copy dotfiles that are not symlinked and are in other locations on disk,
to this directory.

## Nice things to install

First install `brew` (install instructions [here](http://brew.sh/)), if you haven't already.

### nvm

```bash
brew install nvm
```

(The .zshrc included here already includes the necessary setup for nvm)

### node

```bash
nvm install node
```

(The .zshrc included here already includes the necessary setup for nvm)

### jq

JSON Query

```bash
brew install jq
```

### autojump

cd wherever, then `j <shortname>` to jump to any directory you have been

```bash
brew install autojump
```

### eslint

```bash
npm install -g eslint
```

### flow

```bash
npm install -g flow-bin
```

### Gitx

A nice Git Gui

```bash
brew install Caskroom/cask/rowanj-gitx
```

### tvsort

A command line utility that sorts TV Shows to nice folders

```bash
npm install -g tvsort
```
