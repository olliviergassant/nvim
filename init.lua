---Vim Commands
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "

---Install for LazyPath
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

---Plugins and Opts for LazyPath
local opts = {}
local plugins = {
  { "catppuccin/nvim",lazy = false, name = "catppuccin", priority = 1000 },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }},
  { "nvim-treesitter/nvim-treesitter", build= ":TSUpdate"},
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {"nvim-lua/plenary.nvim","MunifTanjim/nui.nvim","nvim-tree/nvim-web-devicons"},},
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},}
}

---Lazypath Settings
require("lazy").setup(plugins, opts)
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

---Telescope Settings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

--Treesitter Settings
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "c", "python", "java"},
  highlight = { enable = true },
  indent = { enable = true }
})
--Neotree Settings
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left')
require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
})


--Indent-blankline Settings
require('ibl').setup({})


