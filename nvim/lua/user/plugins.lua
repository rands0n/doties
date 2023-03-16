local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

require("packer").reset()
require("packer").init({
  compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
})

local use = require("packer").use

use("wbthomason/packer.nvim") -- Let packer manage itself

-- Custom plugins

use("tpope/vim-commentary")
use("tpope/vim-surround")
use("tpope/vim-repeat")
use("tpope/vim-sleuth")
use("tpope/vim-eunuch")
use("tpope/vim-fugitive")
use("sheerun/vim-polyglot")
use("christoomey/vim-tmux-navigator")
use("nelstrom/vim-visual-star-search")
use("jessarcher/vim-heritage")
use("farmergreg/vim-lastplace")

-- using packer.nvim

use({
  "akinsho/bufferline.nvim",
  tag = "v3.*",
  requires = "nvim-tree/nvim-web-devicons",
  after = "onedark.nvim",
  config = function()
    require("user.plugins.bufferline")
  end,
})

use({
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("user.plugins.indent-blankline")
  end,
})

use({
  "airblade/vim-rooter",
  setup = function()
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd("Rooter")
  end,
})

use({
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup()
  end,
})

use({
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup()
  end,
})

use({
  "nvim-telescope/telescope.nvim",
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
  },
  config = function()
    require("user.plugins.telescope")
  end,
})

use({
  "nvim-lualine/lualine.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("user.plugins.lualine")
  end,
})

use({
  "kyazdani42/nvim-tree.lua",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("user.plugins.nvim-tree")
  end,
})

use({
  "jessarcher/onedark.nvim",
  config = function()
    vim.cmd("colorscheme onedark")

    -- Hide the characters in FloatBorder
    vim.api.nvim_set_hl(0, "FloatBorder", {
      fg = vim.api.nvim_get_hl_by_name("NormalFloat", true).background,
      bg = vim.api.nvim_get_hl_by_name("NormalFloat", true).background,
    })

    -- Make the StatusLineNonText background the same as StatusLine
    vim.api.nvim_set_hl(0, "StatusLineNonText", {
      fg = vim.api.nvim_get_hl_by_name("NonText", true).foreground,
      bg = vim.api.nvim_get_hl_by_name("StatusLine", true).background,
    })

    -- Hide the characters in CursorLineBg
    vim.api.nvim_set_hl(0, "CursorLineBg", {
      fg = vim.api.nvim_get_hl_by_name("CursorLine", true).background,
      bg = vim.api.nvim_get_hl_by_name("CursorLine", true).background,
    })

    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#30323E" })
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#2F313C" })
  end,
})

use({
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  requires = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("user.plugins.dashboard-nvim")
  end,
})

use({
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_height = 0.4
    vim.g.floaterm_wintype = "split"
    vim.keymap.set("n", "<A-1>", ":FloatermToggle<CR>")
    vim.keymap.set("t", "<A-1>", "<C-\\><C-n>:FloatermToggle<CR>")
  end,
})

use({
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  requires = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("user.plugins.treesitter")
  end,
})

use({
  "neovim/nvim-lspconfig",
  requires = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    require("user.plugins.lspconfig")
  end,
})

use({
  "hrsh7th/nvim-cmp",
  requires = {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "jessarcher/cmp-path",
    "onsails/lspkind-nvim",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    require("user.plugins.cmp")
  end,
})

use({
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function()
        vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>")
        vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")
        vim.keymap.set("n", "gs", "<cmd>Gitsigns stage_hunk<CR>")
        vim.keymap.set("n", "gS", "<cmd>Gitsigns undo_stage_hunk<CR>")
        vim.keymap.set("n", "gp", "<cmd>Gitsigns preview_hunk<CR>")
        vim.keymap.set("n", "gb", "<cmd>Gitsigns blame_line<CR>")
      end,
    })
  end,
})

use({
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    require("user.plugins.null-ls")
  end,
})

use({
  "vim-test/vim-test",
  config = function()
    require("user.plugins.vim-test")
  end,
})
--

-- Automatically install plugins on first run
if packer_bootstrap then
  require("packer").sync()
end

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
