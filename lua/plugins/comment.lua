return {
  "numToStr/Comment.nvim",
  opts = {
    pre_hook = function()
      if vim.bo.filetype == "c" then
        return "// %s"
      end
    end,
  },
}
