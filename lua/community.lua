-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.colorscheme.sonokai" },
  { import = "astrocommunity.colorscheme.monokai-pro-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = true },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.motion.leap-nvim" },
  -- import/override with your plugins folder
}
