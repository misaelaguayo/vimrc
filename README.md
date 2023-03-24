# general configurations

A way to quickly track my program configurations such as vimrc and tmux

## Tools

- Alacritty
  - fast terminal built in rust
  - configuration file is .alacritty.yml

- Git
  - source control tool
  - configuration file is .gitconfig

- Tmux
  - multiplexing tool which allows multiple windows
  - configuration file is .tmux.conf

- Teamocil
  - Tmux management tool. Allows you to save a tmux configuration for a common work flow set up
  - configuration file(s) are .teamocil/\*.yml

- LunarVim
  - IDE-like vim distribution with opinionated defaults. Allows you to not have to spend a lot of time customizing your nvim
  - configuration file is config.lua

- Vim/Neovim
  - Text editor
  - Alternative to running nvim. Current state is probably broken
  
- Nix package manager
  - package manager aimed for reproducible environments. Easy to transfer setup between computers

## Requirements

- Neovim for lsp
- Nodejs and Yarn
- Ruby to install teamocil
- LunarVim
  - Cargo
  - pip
  - make
  - installation will tell you if you're missing others
- VimPlug for installing dependencies
- Fzf which powers fuzzy searching

## Installation
1. copy everything to home directory
