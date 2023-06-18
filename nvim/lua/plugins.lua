local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.g.mapleader = " "

require("lazy").setup({
    -- Speed
    "nathom/filetype.nvim",
    "lewis6991/impatient.nvim",

    -- Completion tools
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "Saecki/crates.nvim",
                lazy = true,
                keys = {
                    { "<leader>cu", "<cmd>lua require('crates').update_crate()<cr>" },
                    { "<leader>ca", "<cmd>lua require('crates').update_all_crates()<cr>" },
                    { "<leader>cU", "<cmd>lua require('crates').upgrade_crate()<cr>" },
                    { "<leader>cA", "<cmd>lua require('crates').upgrade_all_crates()<cr>" },
                },
            },
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "zbirenbaum/copilot.lua",
            {
                "zbirenbaum/copilot-cmp",
                event = { "InsertEnter", "LspAttach" },
                fix_pairs = true,
            },
            "windwp/nvim-autopairs",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("config.cmp")
            require("config.copilot")
            require("config.crates")
            require("config.autopairs")
        end,
    },
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Files
    {
        "kyazdani42/nvim-tree.lua",
        lazy = true,
        config = function()
            require("config.tree")
        end,
        keys = { { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" } },
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = { { "<leader>ff", "<cmd>Telescope find_files<cr>" } },
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Colours & icons
    "projekt0n/github-nvim-theme",
    "kyazdani42/nvim-web-devicons",
    { "nvim-treesitter/nvim-treesitter",     build = ":TSUpdate", event = "VeryLazy" },

    -- Utils
    "akinsho/bufferline.nvim",
    "nvim-lualine/lualine.nvim",
    { "lewis6991/gitsigns.nvim",             event = "VeryLazy" },
    { "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" },
})
