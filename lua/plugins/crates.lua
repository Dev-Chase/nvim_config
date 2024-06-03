return {
	"saecki/crates.nvim",
	tag = "v0.3.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	ft = {"rust", "toml"},
	config = function()
		require("crates").setup()
		require("crates").show()
	end,
}
