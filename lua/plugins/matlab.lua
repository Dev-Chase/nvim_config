return {
  {
    "idossha/matlab.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "matlab",
    config = function()
      require("matlab").setup {
        -- Minimal configurations or overrides here
        executable = "matlab",

        -- Tmux pane configuration
        panel_size = 30,
        panel_size_type = "percentage",
        tmux_pane_direction = "left",
        tmux_pane_focus = "true",

        auto_start = true,
        default_mappings = true,
        minimal_notifications = true,
        debug = false,
      }
    end,
  },
}
