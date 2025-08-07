return {
  { 
  "catppuccin/nvim",
  lazy = false, 
  name = "catppuccin", 
  priority = 1000, 
  config = fucntion()
    vim.cmd.colorscheme "catppuccin"
  end
}
