-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/which-key.nvim",
        init = function ()
            vim.o.timeoutlen = 1000
        end,
        opts = {},
    },
    {
        "mattn/emmet-vim",
        event = "VeryLazy",
        init = function ()
            vim.g.user_emmet_leader_key = ","
            vim.g.user_emmet_mode="a"
            vim.g.user_emmet_install_global = 0
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {"html", "css"},
                command = "EmmetInstall"
            })
        end
    },
    {
        "Wansmer/treesj",
        keys = {
            {
                "<space>m",
                function ()
                    require("treesj").toggle()
                end,
                desc = "TreeSJ Toggle",
            },
            {
                "<space>M",
                function ()
                    require("treesj").toggle({ split = { recursive = true } })
                end,
                desc = "TreeSJ Recursive Toggle",
            },
        },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function ()
            require("treesj").setup({
                use_default_keymaps = false,
                max_join_length = 300,
            })
        end
    },
    {
        "stevearc/vim-arduino",
        ft = { "arduino" },
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter-context",
    --     event = "VeryLazy",
    --     config = function ()
    --         require'treesitter-context'.setup{
    --             enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    --             max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    --             min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    --             line_numbers = true,
    --             multiline_threshold = 20, -- Maximum number of lines to show for a single context
    --             trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    --             mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    --             -- Separator between context and content. Should be a single character string, like '-'.
    --             -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    --             separator = nil,
    --             zindex = 20, -- The Z-index of the context window
    --             on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    --         }
    --     end
    -- },
}
