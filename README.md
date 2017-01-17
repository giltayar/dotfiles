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
~/.dotfiles/install
```

(this runs rcup and ignores some files that are not dotfiles)

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

### jq

JSON Query

```bash
brew install jq
```

### autojmp

cd wherever, then `j <shortname>` to jump to any directory you have been

```bash
brew install autojmp
```

(The .zshrc included here already includes the necessary setup for nvm)