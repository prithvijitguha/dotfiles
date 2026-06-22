return {
  {
    "TaDaa/vimade",
    -- Loads when you have more than one window split open to save performance
    event = "WinNew",
    config = function()
      -- Custom Vimade configuration can go here if needed
    end,
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
    -- Native Vimscript plugin, lazy loading via keys ensures fast startup
    keys = {
      { "<C-n>", desc = "Find Under (Visual Multi)" },
      { "<C-Down>", desc = "Add Cursor Down" },
      { "<C-Up>", desc = "Add Cursor Up" },
    },
    init = function()
      -- Vimscript global variables must be configured in the "init" stage
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
      }
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
    },
  },
}
