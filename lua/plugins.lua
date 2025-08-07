return = {
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
