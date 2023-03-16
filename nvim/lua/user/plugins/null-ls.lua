require("mason-null-ls").setup({ automatic_installation = true })

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
    require("null-ls").builtins.diagnostics.gitlint,
    require("null-ls").builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js" })
      end,
    }),

    -- Formatters
    require("null-ls").builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js" })
      end,
    }),
    require("null-ls").builtins.formatting.rustfmt.with({
      condition = function(utils)
        return utils.root_has_file({ "Cargo.toml" })
      end,
      extra_args = function(params)
        local Path = require("plenary.path")
        local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

        if cargo_toml:exists() and cargo_toml:is_file() then
          for _, line in ipairs(cargo_toml:readlines()) do
            local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
            if edition then
              return { "--edition=" .. edition }
            end
          end
        end
        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
        return { "--edition=2021" }
      end,
    }),
    require("null-ls").builtins.formatting.surface,
    require("null-ls").builtins.formatting.mix,
    require("null-ls").builtins.formatting.prettierd,
    require("null-ls").builtins.formatting.jq,
    require("null-ls").builtins.formatting.rustywind,
    require("null-ls").builtins.formatting.stylua,
  },
})

vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
