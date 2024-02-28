return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
    opts = {
      -- your options here
      -- If true, will automatically create commands for each LSP method
      create_commands = true,   -- bool
      -- Handler for URL's (used for opening documentation)
      url_handler = 'xdg-open', -- string | function(string)
    },
    config = function()
      -- Normal setup
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
          hover_actions = {
            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = true,
          },
        },
      }
    end
  },
  {
    'vxpm/ferris.nvim',
    ft = { 'rust' },
    opts = {
      -- If true, will automatically create commands for each LSP method
      create_commands = true,   -- bool
      -- Handler for URL's (used for opening documentation)
      url_handler = 'xdg-open', -- string | function(string)
    },
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup {
        ui = {
          code_action = "☯",
        },
      }
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    },
  },
  -- crates
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup()
    end,
  },
}
