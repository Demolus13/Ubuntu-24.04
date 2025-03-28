return {
	{
		"nvim-telescope/telescope.nvim", -- Telescope plugin
		tag = "0.1.8", -- Use a specific version
		dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
		config = function()
			require("telescope").setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					path_display = { "truncate" },
          file_ignore_patterns = {
            "%.git/",
            "node_modules/",
            "%.lock$",
            "__pycache__/",
            ".cache/",
            "%.o", "%.a", "%.out", "%.class", "%.pyc", "%.pyo", "%.exe", "%.dll",
            "build/", "dist/", "target/",
            "log/", "logs/", "%.log",
            ".ipynb_checkpoints/", "%.ipynb",
            "%.jpg", "%.jpeg", "%.png", "%.gif",
          },
				},
				pickers = {
					find_files = {
						hidden = true, -- Show hidden files
					},
				},
			})

			-- Customize the colors
			vim.cmd([[highlight TelescopePromptBorder guifg=#9d7cd8]])
			vim.cmd([[highlight TelescopePromptTitle guifg=#9d7cd8]])

			-- Key mappings
			local builtin = require("telescope.builtin")

			-- Key bindings
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",

		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			-- load extension
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		config = function()
			require("tiny-code-action").setup()
		end,
	},
}
