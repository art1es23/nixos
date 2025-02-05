return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",         -- Completion plugin
    "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer",       -- Buffer source
    "hrsh7th/cmp-path",         -- Path source
    "hrsh7th/cmp-cmdline",      -- Command-line source
    "saadparwaiz1/cmp_luasnip", -- Snippet source
    "L3MON4D3/LuaSnip",         -- Snippet engine
    "rafamadriz/friendly-snippets", -- Predefined snippets
    "windwp/nvim-autopairs",    -- Autopairs
    "williamboman/mason.nvim",  -- LSP installer
    "williamboman/mason-lspconfig.nvim", -- Mason integration for lspconfig
    "jose-elias-alvarez/null-ls.nvim", -- Formatter and Linter
    "zeioth/garbage-day.nvim",  -- Garbage Day plugin
    "jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local autopairs = require("nvim-autopairs")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local null_ls = require("null-ls")
    local garbage_day = require("garbage-day")
    local ts_utils = require("nvim-lsp-ts-utils")

    local on_attach = function(client, bufnr)
      -- Enable formatting on save if supported by the server
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false }) -- Synchronous formatting before saving
          end,
        })
      end

      -- Optional: Add keybindings for LSP functionality
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
      -- no default maps, so you may want to define some here
      -- vim.keymap.set("n", "gs", vim.lsp.buf.organize_imports, opts)
      -- vim.keymap.set("n", "gr", ":TSLspRenameFile<CR>", opts)
      -- vim.keymap.set("n", "gi", ":TSLspImportAll<CR>", opts)
    end

    -- Organize imports in JS files
    local function js_organize_imports()
      local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
      }
      vim.lsp.buf.execute_command(params)
    end


    -- Setup Mason
    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "rust_analyzer", "lua_ls", "gopls", "pyright", "html", "graphql", "emmet_ls", "eslint" },
    })

    -- Load VSCode snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Setup nvim-autopairs
    autopairs.setup({
      check_ts = true,
      disable_filetype = { "TelescopePrompt", "vim" },
    })

    -- Integrate autopairs with nvim-cmp
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- nvim-cmp setup
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })

    -- Extend capabilities for LSP to support nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- LSP Configurations
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    lspconfig.pyright.setup({ capabilities = capabilities })

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = { command = "clippy" },
        },
      },
    })

    lspconfig.gopls.setup({
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
        },
      },
    })

    lspconfig.html.setup({ capabilities = capabilities })

    lspconfig.graphql.setup({ capabilities = capabilities })

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
      init_options = { html = { options = { ["bem.enabled"] = true } } },
    })

    lspconfig.volar.setup({ 
      capabilities = capabilities,
      init_options = {
        vue = {
          hybridMode = false,
        },
      },
      settings = {
        typescript = {
          inlayHints = {
            enumMemberValues = {
              enabled = true,
            },
            functionLikeReturnTypes = {
              enabled = true,
            },
            propertyDeclarationTypes = {
              enabled = true,
            },
            parameterTypes = {
              enabled = true,
              suppressWhenArgumentMatchesName = true,
            },
            variableTypes = {
              enabled = true,
            },
          },
        },
      },
    })

    -- TypeScript/JavaScript (tsserver)
    lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },

        init_options = vim.tbl_deep_extend("force", require("nvim-lsp-ts-utils").init_options, {
            plugins = {
                {
                    name = "@vue/typescript-plugin",
                    location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                    languages = { "vue" },
                },
            },
        }),

        settings = {
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },

        on_attach = function(client, bufnr)
            ts_utils.setup({
                debug = false,
                disable_commands = false,
                enable_import_on_completion = false,

                -- import all
                import_all_timeout = 5000,
                import_all_priorities = {
                    same_file = 1,
                    local_files = 2,
                    buffer_content = 3,
                    buffers = 4,
                },
                import_all_scan_buffers = 100,
                import_all_select_source = false,
                always_organize_imports = true,

                -- filter diagnostics
                filter_out_diagnostics_by_severity = {},
                filter_out_diagnostics_by_code = {},

                -- inlay hints
                auto_inlay_hints = true,
                inlay_hints_highlight = "Comment",
                inlay_hints_priority = 200,
                inlay_hints_throttle = 150,
                inlay_hints_format = {
                    Type = {},
                    Parameter = {},
                    Enum = {},
                },

                -- update imports on file move
                update_imports_on_move = false,
                require_confirmation_on_move = false,
                watch_dir = nil,
            })

            -- required to fix code action ranges and filter diagnostics
            ts_utils.setup_client(client)

            -- key mappings
            local opts = { silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
        end,
    })

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- Automatically fix issues on save
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = true })
            end,
          })
        end
      end,
    })

    -- Setup null-ls for Prettier and ESLint
    null_ls.setup({
      on_attach = on_attach, -- Attach auto-formatting logic
      sources = {
        -- Prettier for formatting
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "css", "scss", "html", "json", "yaml", "markdown", "vue", "svelte" },
        }),
        -- ESLint for diagnostics and formatting
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.eslint_d,
      },
    })

    -- Setup garbage-day
    garbage_day.setup({
      -- Automatically run garbage day for buffers
      auto_clear = true, 
    })
  end,
}
