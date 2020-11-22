# dotfiles

My dotfiles for Mac

## Installation

Just `git clone` this repository anywhere.

To sync the existig settings on your computer to this repository, execute

```sh
./update-dotfiles-repository
```

And then `git commit ... && git push`

To sync your computer from this repository, execute

```sh
./update-computer
```

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

### bat

Command Line File Viewer alternative to `cat`

```bash
brew install bat
```

### autojump

cd wherever, then `j <shortname>` to jump to any directory you have been

```bash
brew install autojump
```

### AltTab

Cmd+Tab like you're on Windows!

```bash
brew cask install alt-tab
```
