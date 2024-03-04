return {
  ["lua_ls"] = {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
        client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME }
            }
          }
        })
        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      end
    end,
    settings = {
      Lua = {
        hint = { enable = true },
      },
    },
  },

  ["jsonls"] = {
    settings = {
      json = { schemas = require("schemastore").json.schemas() },
    },
  },
}
