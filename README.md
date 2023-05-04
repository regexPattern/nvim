# Neovim

My Neovim configuration, tailored to my personal needs and liking.

![Neovim config #1](https://user-images.githubusercontent.com/47466248/236054647-037567ac-dd12-4add-b8a8-5d4b4604d831.png)

## Features

Some of the core features of my config include:

* Language Server Protocol support.
* Code autocompletion.
* Fuzzy finder.
* Tree-sitter support.

I'm using [lazy.nvim](https://github.com/folke/lazy.nvim) as a plugin manager. You can check which plugins I use by looking at the [`plugins`](https://github.com/regexPattern/nvim/tree/main/lua/plugins) folder.

## Requirements

* Latest stable version of Neovim.
* [`fzf`](https://github.com/junegunn/fzf) binaries installed.
* Git installed.
* A C compiler like gcc or clang.

## Mappings

I usually don't remap Neovim movement keybinds, and have relatively few mappings. You can find the plugin agnostic mappings in the [`mappings.lua`](https://github.com/regexPattern/nvim/blob/main/lua/mappings.lua) file and the LSP related ones in the [`lspconfig/mappings.lua`](https://github.com/regexPattern/nvim/blob/main/lua/plugins/lspconfig/mappings.lua) file. For mappings specific to a certain plugin, you can find its mappings in its corresponding config file.

## Philosophy

I like to keep my config simple and relatively minimal, at least for what I consider minimal. There are not a lot of UI modifications to Neovim's defaults, so, for example, you won't find any statusline plugin or other plugins that override or extend the UI capabilities of Neovim such as prettifying the popups or replacing the quickfix list or command line.
