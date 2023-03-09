# Nvim

Neovim is my text editor of choice because of the Vim workflow and how much you
can customize the editor to your needs. This naturally leads to a massive
configuration repo like this one.

## Requiriments

Most of the time I'm using the latest stable version of Neovim, but if you try
this config on the stable version and it doesn't work for you, then try with
the nightly version.

Other dependencies are subject to the language servers you install
independently. For example, if you install the typescript-language-server you
are going to need to have Node and NPM installed, or for installing
rust-analyzer, you will have to have Rust installed.

## Plugins

I do use what I consider to be a lot of plugins. Usually I like plugins that
just add something to the Neovim experience instead of changing the default
behaviour. Among the most important ones are:

* [Lazy.nvim](https://github.com/folke/lazy.nvim)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [mason.nvim](https://github.com/williamboman/mason.nvim)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [telescope.nvim](https://github.com/hrsh7th/nvim-cmp)
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Keep in mind that my configuration is always changing, so these dotfiles are
pretty unstable. I suggest you to take what you like to build your own config,
after all, that's the point of using a
[PDE](https://www.youtube.com/watch?v=QMVIJhC9Veg) like Neovim.
