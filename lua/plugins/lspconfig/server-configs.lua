local function getluaruntimepath()
  local runtimepath = vim.split(package.path, ";")
  table.insert(runtimepath, "lua/?.lua")
  table.insert(runtimepath, "lua/?/init.lua")
  return runtimepath
end

return {
  lua_ls = {
    settings = {
      Lua = {
        completion = { callSnippet = "Replace" },
        hint = { enable = true },
        runtime = {
          version = "LuaJIT",
          path = getluaruntimepath(),
        },
        diagnostics = { globals = { "vim" } },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.stdpath "config" .. "/lua",
          },
        },
        telemetry = { enable = false },
      },
    },
  },
  jsonls = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
  tsserver = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
}
