# erich2s's dotfiles

This repository contains my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

> [!NOTE]
> Reference: [Video tutorial](https://www.youtube.com/watch?v=y6XCebnB9gs)

## Prerequisites

### Install `Homebrew`

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Start

First, clone this repository:

```bash
git clone https://github.com/erich2s/dotfiles.git
cd dotfiles
```

Then, install `brew` packages:

```bash
brew bundle
```

And Use `stow` to create symlinks:

```bash
stow .
```
