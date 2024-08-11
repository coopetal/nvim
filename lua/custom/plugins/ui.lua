return {
  -- UI related plugins
  -- TODO: Move other UI related plugins from init.lua to here
  -- TODO: Add plugins: folke/edgy.nvim, mbbill/undotree
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- Uncomment specific sections to override defaults
      sections = {
        -- lualine_a = { 'mode' },
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- lualine_c = { 'filename' },
        -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'location', 'progress' },
        lualine_z = { 'hostname' },
      },
      tabline = {
        lualine_a = {},
        lualine_b = { 'tabs' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      --     {
      --       's1n7ax/nvim-window-picker',
      --       config = function()
      --         require('window-picker').setup()
      --       end,
      --     },
      { 'MunifTanjim/nui.nvim', lazy = true },
    },
    init = function()
      require('which-key').add {
        { '<leader>e', group = 'Neotree' },
      }
    end,
    keys = {
      { '<leader>ee', '<cmd>Neotree toggle left<CR>', desc = 'Toggle' },
      { '<leader>ef', '<cmd>Neotree toggle float<CR>', desc = 'Floating window' },
      { '<leader>eg', '<cmd>Neotree toggle left git_status<CR>', desc = 'Git status' },
      { '<leader>eb', '<cmd>Neotree toggle left buffers<CR>', desc = 'Show buffers' },
      { '<leader>eo', '<cmd>Neotree toggle left document_symbols<CR>', desc = 'Symbols Outline' },
    },
    opts = {
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = 'filesystem' },
          { source = 'git_status' },
          { source = 'buffers' },
          { source = 'document_symbols' },
        },
      },
      sources = {
        'filesystem',
        'git_status',
        'buffers',
        'document_symbols',
      },
      filesystem = {
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_hidden = false, -- only works on Windows for hidden files/directories
        },
      },
      document_symbols = {
        follow_cursor = true,
        renderers = {
          symbol = {
            { 'indent', with_expanders = true },
            { 'kind_icon', default = '?' },
            { 'name', zindex = 10 },
            -- removed the kind text as its redundant with the icon
          },
        },
      },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      { '<M-1>', '<cmd>ToggleTerm size=20 direction=horizontal<CR>', mode = { 'n', 't' } },
      { '<M-2>', '<cmd>ToggleTerm size=60 direction=vertical<CR>', mode = { 'n', 't' } },
      { '<M-3>', '<cmd>ToggleTerm direction=float<CR>', mode = { 'n', 't' } },
      { '<esc>', [[<C-\><C-n>]], mode = 't', buffer = 0 },
      { '<C-h>', [[<Cmd>wincmd h<CR>]], mode = 't', buffer = 0 },
      { '<C-j>', [[<Cmd>wincmd j<CR>]], mode = 't', buffer = 0 },
      { '<C-k>', [[<Cmd>wincmd k<CR>]], mode = 't', buffer = 0 },
      { '<C-l>', [[<Cmd>wincmd l<CR>]], mode = 't', buffer = 0 },
      { '<C-w>', [[<C-\><C-n><C-w>]], mode = 't', buffer = 0 },
    },
    opts = {
      open_mapping = '<C-\\>',
      dir = 'git_dir',
      direction = 'float',
      shade_terminals = true,
    },
  },
}
