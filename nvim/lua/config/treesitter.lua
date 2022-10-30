require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"typescript",
		"javascript",
		"rust",
		"toml",
		"go",
		"c",
		"cpp",
		"vue",
		"tsx",
		"css",
		"scss",
		"lua",
		"html",
		"fish",
		"json",
		"latex",
		"python"
	},
	highlight = { enable = true }
})
