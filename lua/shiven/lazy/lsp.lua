return {
	"neovim/nvim-lspconfig",

	dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip'
    },

	config = function()
		require("mason").setup()
        require("mason-lspconfig").setup({})

		local cmp = require'cmp'
		cmp.setup({

		snippet = {
			expand = function(args)
				-- Native Vim completion popups
				vim.snippet.expand(args.body)
			end,
		},

		window = { },

		mapping = cmp.mapping.preset.insert({
		  ['<C-Space>'] = cmp.mapping.complete(),
		  ['<tab>'] = cmp.mapping.confirm({ select = true }),
		}),

		sources = cmp.config.sources(
			{
				{ name = 'nvim_lsp', max_item_count = 8},
				{ name = 'vsnip' }, 
			}, 

			{
				{ name = 'buffer' },
			}
		)
	})


		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		require('lspconfig')['lua_ls'].setup {
			capabilities = capabilities
		}

		require('lspconfig')['pyright'].setup {
			settings = {
				python = {
					-- EDIT THIS!
					pythonPath = "/home/shiven/Venv/bin/python"

				}
			}
		}
	end
}
