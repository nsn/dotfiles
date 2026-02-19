return {
  "ThePrimeagen/99",
  dependencies = {
    "opencode-ai/opencode",           -- required AI backend
    "nvim-treesitter/nvim-treesitter", -- very likely needed for parsing/context
    -- "hrsh7th/nvim-cmp",            -- already in AstroNvim, but if you want to be explicit
  },
  -- lazy = false,                      -- or true + event/cmd/keys below if you prefer lazy-loading
  -- event = "VeryLazy",                -- example; adjust based on your needs
  config = function()
    local _99 = require("99")

    -- Optional: for debugging logs per project
    local cwd = vim.uv.cwd()
    local basename = vim.fs.basename(cwd)

    _99.setup({
      -- provider = _99.ClaudeCodeProvider,    -- uncomment/change if you want Claude instead of default OpenCode
      -- model = "your-model-name",            -- if needed for your provider

      logger = {
        level = _99.DEBUG,
        path = "/tmp/" .. basename .. ".99.debug",
        print_on_error = true,
      },

      completion = {
        -- cursor_rules = "<custom path to cursor rules>",  -- disabled in your example
        custom_rules = {
          "scratch/custom_rules/",
        },
        files = {
          -- enabled = true,
          -- max_file_size = 102400,
          -- max_files = 5000,
          -- exclude = { ".env", ".env.*", "node_modules", ".git" },
        },
        source = "cmp",  -- AstroNvim uses cmp by default → good match
      },

      md_files = {
        "AGENT.md",
      },
    })

    -- Keymaps (visual-mode only as in your example)
    -- Feel free to change <leader>9 to something else if you prefer
    vim.keymap.set("v", "<leader>9v", function()
      _99.visual()
    end, { desc = "99: Visual selection to agent" })

    vim.keymap.set("v", "<leader>9s", function()
      _99.stop_all_requests()
    end, { desc = "99: Stop all agent requests" })

    -- Optional: add normal-mode entry point if you want (many users do)
    -- vim.keymap.set("n", "<leader>99", function() _99.prompt() end, { desc = "99: Open prompt" })
  end,
}
