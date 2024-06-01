-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = false, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        expandtab = false,
        autoindent = true,
        -- cindent = true,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map


        -- mappings seen under group name "Tab"
        ["<Leader>Tn"] = {"<cmd>tabnew<cr>", desc = "New Tab"},
        ["<Leader>Tc"] = {"<cmd>tabclose<cr>", desc = "Close Tab"},
        ["<Leader>Te"] = {":tcd", desc = "Change Tab Directory"},

        -- mappings seen under group name "TodoTelescope"
        ["<Leader>ft"] = {"<cmd>TodoTelescope<cr>", desc = "Find TODO's"},
        ["<Leader>st"] = {"<cmd>TodoTelescope<cr>", desc = "Find TODO's"},

        -- mappings seen under group name "Treesitter-Context"
        ["[c"] = {function() require("treesitter-context").go_to_context() end, desc = "Go to context"},

        -- mappings seen under group name "Treesitter-Context"
        ["<MS-b>"] = {"<cmd>:make run<cr>", desc = "Run with Make"},
        ["<MS-v>"] = {"<cmd>:make<cr>", desc = "Make"},

        -- mappings seen under group name "Arduino Vim"
        ["<C-a>v"] = { "<cmd>ArduinoVerify<cr>"},
        ["<C-a>u"] = { "<cmd>ArduinoUpload<cr>"},
        ["<C-a>s"] = { "<cmd>ArduinoSerial<cr>"},
        ["<C-a>b"] = { "<cmd>ArduinoChooseBoard<cr>"},
        ["<C-a>p"] = { "<cmd>ArduinoChooseProgrammer<cr>"},
        ["<C-a>a"] = { "<cmd>ArduinoAttach<cr>"},

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- window resizing mappings
        ["<C-=>"] = {"<cmd>resize+2<cr>", desc = "Resize Horizontal +"},
        ["<C-_>"] = {"<cmd>resize-2<cr>", desc = "Resize Horizontal -"},
        ["<M-=>"] = {"<cmd>vertical resize+2<cr>", desc = "Resize Horizontal +"},
        ["<M-->"] = {"<cmd>vertical resize-2<cr>", desc = "Resize Horizontal -"},

        -- mappings seen under group name "ToggleTerm"
        ["<Leader>tT"] = {"<cmd>ToggleTerm direction=tab<cr>", desc = "ToggleTerm Tab" },
        ["<M-'>"] = {"<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },

        -- General Mappings
        ["<C-s>"] = {":w!<cr>", desc = "Save File" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>T"] = { desc = "Tabs" },
        ["<Leader>s"] = { desc = "Search" },
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      t = {
        -- window resizing mappings
        ["<C-=>"] = {"<cmd>resize+2<cr>", desc = "Resize Horizontal +"},
        ["<C-_>"] = {"<cmd>resize-2<cr>", desc = "Resize Horizontal -"},
        ["<M-=>"] = {"<cmd>vertical resize+2<cr>", desc = "Resize Horizontal +"},
        ["<M-->"] = {"<cmd>vertical resize-2<cr>", desc = "Resize Horizontal -"},

        -- tab mappings
        ["<C-h>"] = {function() vim.cmd.tabprevious() end, desc = "Switch Tab"},

        -- ToggleTerm
        ["<M-'>"] = {"<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      },
    },
  },
}
