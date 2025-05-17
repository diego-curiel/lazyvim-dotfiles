return {
  {
    "catppuccin/nvim",
    opts = function(_, opts)
      opts.transparent_background = true
      opts.flavour = "frappe"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
