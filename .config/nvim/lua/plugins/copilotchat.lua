return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  opts = {
    -- See Configuration section for options
  },
  keys = {
    { "<leader>aC", "<CMD>CopilotChat<CR>", mode = { "n", "v" }, desc = "Copilot Chat" },
  }
}
